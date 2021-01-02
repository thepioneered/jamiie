import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
import '../../models/Loan/loanModel.dart';
import 'package:flutter/material.dart';

class LoanScreenProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  LoanModel loanModel = LoanModel();

  Future<Null> loadPageData(String poolId) async {
    // try {
    //   LoaderDialog.loaderDialog(scaffoldKey.currentContext);
    // } catch (e) {
    //   throw Exception(e);
    // }
    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
        key: scaffoldKey,
        endPoint: EndPoints.loanDetail,
        afterRequest: () {},
        authRequest: true,
        shouldPagePop: true,
        body: {"poolId": "$poolId"});
    print(data);
    if (data["status"]) {
      loanModel = LoanModel.fromJson(data["body"]["response"]);
      print('--------------');
      print(loanModel.amount.toString());
      print(loanModel.interest.toString());
      // Navigator.pop(scaffoldKey.currentContext);
    }
  }
}
