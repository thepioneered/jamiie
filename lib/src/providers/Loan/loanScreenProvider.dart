import 'package:Jamiie/src/models/Loan/confirmLoanModel.dart';
import 'package:Jamiie/src/models/poolId.dart';
import 'package:Jamiie/src/screens/userJoinedPools/joinPoolDataPage.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/utils/snackBar.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
import '../../models/Loan/loanModel.dart';
import 'package:flutter/material.dart';

class LoanScreenProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  LoanModel loanModel = LoanModel();
  ConfirmLoanModel confirmLoanModel = ConfirmLoanModel();

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

  void confirmLoan(final String poolId) async {
    // pageModel.onceFormSubmitted = true;
    try {
      LoaderDialog.loaderDialog(scaffoldKey.currentContext);
    } catch (e) {
      throw Exception(e);
    }
    String mobile = await LocalStorage.getMobile();
    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
        key: scaffoldKey,
        endPoint: EndPoints.confirmLoan,
        afterRequest: () {},
        authRequest: true,
        shouldPagePop: true,
        // body: {"poolId": "$poolId","phone": "$mobile"});

        body: PoolIdMobileModel().toJson(poolId, mobile));
    print(data);
    if (data["status"]) {
      confirmLoanModel = ConfirmLoanModel.fromJson(data["body"]);
      print('++++++++++++++++');
      print(confirmLoanModel.response);
      scaffoldKey.currentState.showSnackBar(
        AppSnackBar.snackBar(
            title: "Your loan is succesfully applied",
            backgroundColor: AppColors.green),
      );
      Navigator.pop(scaffoldKey.currentContext);
      // Navigator.pushAndRemoveUntil(
      //     scaffoldKey.currentContext,
      //     MaterialPageRoute(builder: (_) => JoinPoolDataPage(poolId: poolId)),
      //     (route) => false);
      Navigator.pop(scaffoldKey.currentContext);
    }
  }
}
