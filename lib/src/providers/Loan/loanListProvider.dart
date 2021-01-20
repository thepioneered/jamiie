import 'package:Jamiie/src/models/Loan/loanListModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';

class LoanListProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  LoanList loanListModel;

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
    if (data["status"]) {
      loanListModel = LoanList.fromJson(data["body"]);
      print("lllllllllllll");
      print(loanListModel.loanList[0].poolId);
    } else {
      return Future.error("Error Occured");
    }
  }
}
