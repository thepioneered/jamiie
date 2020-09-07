import 'package:Jamiie/src/models/Dashboard/dashCardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class DashboardProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> dashboardScaffoldKey = GlobalKey<ScaffoldState>();
  DashboardModel dashboardModel;

  Future<Null> loadPageAsset() async {
    await loadJson().then((value) {
      Map<String, dynamic> val = json.decode(value);
      dashboardModel = DashboardModel.fromJson(val);
      return null;
    });
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/Json/dashboard.json');
  }
}
