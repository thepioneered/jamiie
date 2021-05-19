import 'package:Jamiie/src/models/AdminPaymentDetails/adminNotPaidUserDetailsModel.dart';
import 'package:Jamiie/src/models/AdminPaymentDetails/adminPaidUserDetailsModel.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import 'package:flutter/material.dart';

class AdminTransationListProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AdminNotPaidUserListModel adminNotPaidUserListModel;
  AdminPaidUserListModel adminPaidUserListModel;

  Future<Null> loadPageData(String poolId) async {
    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
        key: scaffoldKey,
        endPoint: EndPoints.adminPaidUserDetail,
        afterRequest: () {},
        authRequest: true,
        shouldPagePop: false,
        body: {"poolId": "$poolId"});

    // Map<String, dynamic> data2 = await NetworkCalls.postDataToServer(
    //     key: scaffoldKey,
    //     endPoint: EndPoints.adminNotPaidUserDetail,
    //     afterRequest: () {},
    //     authRequest: true,
    //     shouldPagePop: false,
    //     body: {"poolId": "$poolId"});

    if (data["status"]) {
      print('---------------1111111111----------------------');

      adminPaidUserListModel = AdminPaidUserListModel.fromJson(data["body"]);
      print(adminPaidUserListModel.adminpaidUserList[0].poolId);
    } else {
      return Future.error("Error Occured");
    }
  }
}
