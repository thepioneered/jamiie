import 'package:Jamiie/src/models/userJoinedPools/joinPoolScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class JoinPoolScreenProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> joinPoolScreenScaffoldKey = GlobalKey<ScaffoldState>();
  JoinPoolScreenModel joinPoolScreenModel;

  Future<Null> loadPageAsset() async {
    await loadJson().then((value) {
      Map<String, dynamic> val = json.decode(value);
    //  print(val);
      joinPoolScreenModel = JoinPoolScreenModel.formJson(val);
      //print(joinPoolScreenModel.poolName);
      return null;
    });
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/Json/poolScreen.json');
  }
}
