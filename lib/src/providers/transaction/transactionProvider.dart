import 'package:Jamiie/src/models/base/pageModel.dart';
import 'package:Jamiie/src/models/createPoolModels/poolidModel.dart';
import 'package:Jamiie/src/screens/Dashboard/dashboard.dart';
import 'package:Jamiie/src/screens/navbar.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/utils/snackBar.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
import 'package:flutter/material.dart';
import '../../models/transaction/transactionModel.dart';

class TransactionProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> transactionPageScaffoldKey =
      GlobalKey<ScaffoldState>();
  TransactionModel transactionModel = TransactionModel();
  PageModel pageModel = PageModel();
  Amount amount;

  Future<Null> loadPageData(String poolId) async {
    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
        key: transactionPageScaffoldKey,
        endPoint: EndPoints.poolAmount,
        afterRequest: () {},
        authRequest: true,
        shouldPagePop: false,
        body: {"poolId": "$poolId"});
    if (data["status"]) {
      print(data);
      amount = Amount.fromJson(data["body"]);
      print("Check ${amount.poolAmount}");

      // return null;
    } else {
      return Future.error("Error Occured");
    }
  }

  void confirmPayment() async {
    pageModel.onceFormSubmitted = true;
    try {
      LoaderDialog.loaderDialog(transactionPageScaffoldKey.currentContext);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class Amount {
  String poolAmount;
  Amount({this.poolAmount});
  Amount.fromJson(Map<String, dynamic> json) : poolAmount = json["amount"];
}
