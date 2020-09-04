import 'package:Jamiie/src/models/Dashboard/dashCardModel.dart';
import 'package:Jamiie/src/models/Dashboard/transactionModel.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> dashboardScaffoldKey = GlobalKey<ScaffoldState>();

  // Future<Null> getDashboardData() async {
  //   await Future.delayed(Duration(seconds: 5), () {
      
  //   });
    // }

    UserName userName = UserName();
    PoolNumbers poolNumbers = PoolNumbers();
  final List<Transaction> usertransaction= [
    
    Transaction(
      id: 't1',
      amount: 1000,
      date: DateTime.now(),
      name: 'Pool 1',
    ),
    Transaction(
      id: 't2',
      amount: 800,
      date: DateTime.now(),
      name: 'Pool 5',
    ),
    Transaction(
      id: 't3',
      amount: 600,
      date: DateTime.now(),
      name: 'Pool 3',
    ),
    Transaction(
      id: 't4',
      amount: 750,
      date: DateTime.now(),
      name: 'Pool 4',
    ),
    Transaction(
      id: 't5',
      amount: 600,
      date: DateTime.now(),
      name: 'Pool 6',
    ),
    Transaction(
      id: 't5',
      amount: 600,
      date: DateTime.now(),
      name: 'Pool 6',
    ),
  ];
    
}
