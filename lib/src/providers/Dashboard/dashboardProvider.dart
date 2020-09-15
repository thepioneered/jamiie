import 'package:Jamiie/src/models/Dashboard/dashCardModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class DashboardProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> dashboardScaffoldKey = GlobalKey<ScaffoldState>();
  DashboardModel dashboardModel;
  
  Future<Null> loadPageAsset() async {
    String mobile = await LocalStorage.getMobile();
    mobile = mobile.substring(1, mobile.length);
   
    // print(mobile); 
    // print(EndPoints.dashboard + mobile);
    // print('hello');
    Map<String, dynamic> data = await NetworkCalls.getDataFromServer(
      shouldPagePop: false,
      key: dashboardScaffoldKey,
      endPoint: EndPoints.dashboard + mobile,
      authRequest: true,
    );
    // print(data);
    // print(data["body"]);

    if(data["status"])
    {
     dashboardModel = DashboardModel.fromJson(data["body"]);
     return null;
    }

    // await loadJson().then((value) {
    //   Map<String, dynamic> val = json.decode(value);
    //   dashboardModel = DashboardModel.fromJson(val);
    //   return null;
    // });
   }

  // Future<String> loadJson() async {
  //   return await rootBundle.loadString('assets/Json/dashboard.json');
  // }
}
