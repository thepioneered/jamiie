import 'package:Jamiie/src/models/Dashboard/dashCardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class DashboardProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> dashboardScaffoldKey = GlobalKey<ScaffoldState>();
  DashboardModel dashboardModel = DashboardModel();

  PoolNumbers poolNumbers = PoolNumbers();

  // final List<Transaction> usertransaction = [
  //   Transaction(
  //     id: 't1',
  //     amount: 1000,
  //     date: '22-08-2020',
  //     name: 'Pool 1',
  //   ),
  //   Transaction(
  //     id: 't2',
  //     amount: 800,
  //     date: '22-08-2020',
  //     name: 'Pool 5',
  //   ),
  //   Transaction(
  //     id: 't3',
  //     amount: 600,
  //     date: '22-08-2020',
  //     name: 'Pool 3',
  //   ),
  //   Transaction(
  //     id: 't4',
  //     amount: 750,
  //     date: '22-08-2020',
  //     name: 'Pool 4',
  //   ),
  //   Transaction(
  //     id: 't5',
  //     amount: 600,
  //     date: '22-08-2020',
  //     name: 'Pool 6',
  //   ),
  //   Transaction(
  //     id: 't5',
  //     amount: 600,
  //     date: '22-08-2020',
  //     name: 'Pool 6',
  //   ),
  // ];

  Future<Null> loadPageAsset() async {
    await loadJson().then((value) {
      print(value);
      // dashboardModel=json.decode(value.toString());
      Map<String, dynamic> val = json.decode(value);
      print(val);
      print(val.runtimeType);
      // print(val["name"]);

//     print(dashboardModel.name);
      dashboardModel = DashboardModel.fromJson(val);
      print(dashboardModel.name);
      return null;
    });
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/Json/dashboard.json');
  }
}
