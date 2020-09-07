import 'package:Jamiie/src/models/userJoinedPools/joinPoolListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class JoinPoolProvider extends ChangeNotifier{

  GlobalKey<ScaffoldState> listOfJoinedPoolScaffoldKey=GlobalKey<ScaffoldState>();
  JoinPoolListModel joinPoolListModel;

  Future<Null> loadPageAsset() async {
    await loadJson().then((value) {
      Map<String, dynamic> val = json.decode(value);
     // print(val);
      joinPoolListModel = JoinPoolListModel.fromJson(val);
      return null;
      
    });
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/Json/joinPool.json');
  }


}