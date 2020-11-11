import 'package:Jamiie/src/models/base/pageModel.dart';
import 'package:Jamiie/src/models/createPoolModels/poolidModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/utils/snackBar.dart';
import 'package:flutter/material.dart';
import '../../models/transaction/transactionModel.dart';

class TransactionProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TransactionModel transactionModel = TransactionModel();
  PageModel pageModel = PageModel();

  void transactionLogic(String poolId) async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      String mobile = await LocalStorage.getMobile();
      print(transactionModel.toJson(mobile, poolId));
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: scaffoldKey,
          endPoint: EndPoints.transaction,
          afterRequest: () {},
          authRequest: true,
          shouldPagePop: false,
          body: transactionModel.toJson(mobile, poolId));

      // print(body);
      if (body["status"]) {
        Navigator.pop(scaffoldKey.currentContext);
        pageModel.onceFormSubmitted = false;
        formKey.currentState.reset();
        notifyListeners();
        AppSnackBar.snackBar(
            title: "Payment Successful", backgroundColor: AppColors.green);
      } else {
        AppSnackBar.snackBar(
            title: "Payment Unsuccessful", backgroundColor: AppColors.red);
      }
    }
  }
}
