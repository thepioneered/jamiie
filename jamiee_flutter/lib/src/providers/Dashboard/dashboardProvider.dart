import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> dashboardScaffoldKey = GlobalKey<ScaffoldState>();

  Future<Null> getDashboardData() async {
    await Future.delayed(Duration(seconds: 5), () {
      
    });
  }
}
