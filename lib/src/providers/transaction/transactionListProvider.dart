import 'package:Jamiie/src/models/TransactionList/transactionListModel.dart';
import 'package:Jamiie/src/models/auth/mobileModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';

class TransationListProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> transactionListPageScaffoldKey =
      GlobalKey<ScaffoldState>();
  MobileModel _mobileModel;
  TransactionListModel transactionListModel;

  Future<Null> loadPageData() async {
    String _mobile = await LocalStorage.getMobile();
    _mobileModel = MobileModel();
    _mobileModel.mobile = _mobile;
    Map<String, dynamic> response = await NetworkCalls.postDataToServer(
        key: transactionListPageScaffoldKey,
        endPoint: EndPoints.paidUserDetail,
        afterRequest: () {},
        authRequest: true,
        shouldPagePop: false,
        body: _mobileModel.toJson());
    if (response["status"]) {
      print(response);
      transactionListModel = TransactionListModel();
      // transactionListModel.
    } else {
      return Future.error("Error Occured");
    }
  }
}
