import 'package:Jamiie/src/models/Loan/loanListModel.dart';
import 'package:Jamiie/src/models/Loan/repayLoanModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/utils/snackBar.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
import 'package:flutter/material.dart';

class LoanListProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  LoanList loanListModel;
  RepayLoanModel repayLoanModel;

  Future<Null> loadPageData() async {
    String mobile = await LocalStorage.getMobile();
    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
      key: scaffoldKey,
      endPoint: EndPoints.loanList,
      afterRequest: () {},
      authRequest: true,
      shouldPagePop: false,
      body: {"phone": "$mobile"},
    );
    print("fffffffffffffffff");
    print(data["body"]);
    List<dynamic> list = data["body"];
    if (data["status"] && list.isNotEmpty) {
      loanListModel = LoanList.fromJson(data);
      print("lllllllllllll");
      print(loanListModel.loanList[0].poolId);
    } else if (list.isEmpty) {
      return Future.error(404);
    } else {
      return Future.error("Error Occured");
    }
  }

  void repayLoan(final String transactionId) async {
    try {
      LoaderDialog.loaderDialog(scaffoldKey.currentContext);
    } catch (e) {
      throw Exception(e);
    }
    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
        key: scaffoldKey,
        endPoint: EndPoints.repayloan,
        afterRequest: () {},
        authRequest: true,
        shouldPagePop: true,
        body: {"transactionId": "$transactionId"});
    print(data);
    if (data["status"]) {
      repayLoanModel = RepayLoanModel.fromJson(data["body"]);
      print('++++++++++++++++');
      print(repayLoanModel.message);

      scaffoldKey.currentState.showSnackBar(
        AppSnackBar.snackBar(
            title: "Your loan is succesfully paid",
            backgroundColor: AppColors.green),
      );
      Navigator.pop(scaffoldKey.currentContext);
      Future.delayed(Duration(milliseconds: 1000), () {
        Navigator.pop(scaffoldKey.currentContext);
        Navigator.pop(scaffoldKey.currentContext);
      });
    }
  }
}
