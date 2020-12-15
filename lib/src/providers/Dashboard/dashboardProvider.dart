import 'package:Jamiie/src/models/Dashboard/dashCardModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> dashboardScaffoldKey = GlobalKey<ScaffoldState>();
  DashboardModel dashboardModel;

  Future<Null> loadPageAsset() async {
    String mobile = await LocalStorage.getMobile();
    mobile = mobile.substring(1, mobile.length);

    Map<String, dynamic> data = await NetworkCalls.getDataFromServer(
      shouldPagePop: false,
      key: dashboardScaffoldKey,
      endPoint: EndPoints.dashboard + mobile,
      authRequest: true,
    );

    if (data["status"]) {
  
        dashboardModel = DashboardModel.fromJson(data["body"]);
        
        return null;
   
    } else {
      return Future.error("Check");
    }
  }
}
