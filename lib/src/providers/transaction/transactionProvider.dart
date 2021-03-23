import '../../models/base/pageModel.dart';
import '../../models/poolId.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../styles/colors.dart';
import '../../utils/sharedPref.dart';
import '../../utils/snackBar.dart';
import '../../widgets/loaderDialog.dart';
import 'package:flutter/material.dart';
import '../../models/transaction/transactionModel.dart';

class TransactionProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> transactionPageScaffoldKey =
      GlobalKey<ScaffoldState>();
  TransactionModel transactionModel = TransactionModel();
  // LoanModel loanModel;
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
      print("Check ${amount.poolAmount.toString()}");

      // return null;
    } else {
      return Future.error("Error Occured");
    }
  }

  void confirmPayment(final String poolId) async {
    // pageModel.onceFormSubmitted = true;
    try {
      LoaderDialog.loaderDialog(transactionPageScaffoldKey.currentContext);
    } catch (e) {
      throw Exception(e);
    }
    String mobile = await LocalStorage.getMobile();
    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
        key: transactionPageScaffoldKey,
        endPoint: EndPoints.paymentTransafer,
        afterRequest: () {},
        authRequest: true,
        shouldPagePop: true,
        body: PoolIdMobileModel().toJson(poolId, mobile));

    if (data["status"]) {
      transactionPageScaffoldKey.currentState.showSnackBar(
        AppSnackBar.snackBar(
            title: "Payment Done", backgroundColor: AppColors.green),
      );
      Navigator.pop(transactionPageScaffoldKey.currentContext);
    }
  }

  // void takeLoan(final String poolId) async {
  //   try {
  //     LoaderDialog.loaderDialog(transactionPageScaffoldKey.currentContext);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  //   Map<String, dynamic> data = await NetworkCalls.postDataToServer(
  //       key: transactionPageScaffoldKey,
  //       endPoint: EndPoints.loanDetail,
  //       afterRequest: () {},
  //       authRequest: true,
  //       shouldPagePop: true,
  //       body: {"poolId": "$poolId"});
  //   print(data);
  //   if (data["status"]) {
  //     loanModel = LoanModel.fromJson(data["body"]["response"]);
  //     print(loanModel.amount.toString());
  //     print(loanModel.interest.toString());
  //     Navigator.pop(transactionPageScaffoldKey.currentContext);
  //   }
  // }
}

class Amount {
  int poolAmount;
  Amount({this.poolAmount});
  Amount.fromJson(Map<String, dynamic> json) : poolAmount = json["amount"];
}
