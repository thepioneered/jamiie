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
      joinPoolScreenModel = JoinPoolScreenModel.formJson(val);
      return null;
    });
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/Json/poolScreen.json');
  }
}
