import 'package:Jamiie/src/models/TransactionList/notPaidUserDetailModel.dart';
import 'package:Jamiie/src/models/TransactionList/paidUserDetailModel.dart';
import 'package:Jamiie/src/models/auth/mobileModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';

class TransationListProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> transactionListPageScaffoldKey =
      GlobalKey<ScaffoldState>();
  MobileModel _mobileModel;
  PaidUserListModel paidUserListModel;
  // NotPaidUserListModel notPaidUserListModel;

  Future<Null> loadPageData() async {
    String _mobile = await LocalStorage.getMobile();
    _mobileModel = MobileModel();
    _mobileModel.mobile = _mobile;

    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
      key: transactionListPageScaffoldKey,
      endPoint: EndPoints.paidUserDetail,
      afterRequest: () {},
      authRequest: true,
      shouldPagePop: false,
      body: _mobileModel.toJson(),
    );

    // Map<String, dynamic> data2 = await NetworkCalls.postDataToServer(
    //   key: transactionListPageScaffoldKey,
    //   endPoint: EndPoints.notPaidUserDetail,
    //   afterRequest: () {},
    //   authRequest: true,
    //   shouldPagePop: false,
    //   body: _mobileModel.toJson(),
    // );
    if (data["status"]) {
      print('---------------1111111111----------------------');

      paidUserListModel = PaidUserListModel.fromJson(data["body"]);
      print(paidUserListModel.paidUserList[0].amount);
    } else {
      return Future.error("Error Occured");
    }
    // if (data2["status"]) {
    //   print('---------------222222222----------------------');

    //   notPaidUserListModel = NotPaidUserListModel.fromJson(data2["body"]);
    // } else {
    //   return Future.error("Error Occured");
    // }
  }
}
