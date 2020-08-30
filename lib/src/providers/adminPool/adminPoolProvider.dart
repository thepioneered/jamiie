import 'dart:convert';
import 'package:Jamiie/src/models/adminPoolModel/poolDataModel.dart';
import 'package:Jamiie/src/models/adminPoolModel/poolListModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminPoolProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> listOfCreatedPoolsScaffoldKey =
      GlobalKey<ScaffoldState>();

  PoolListModel poolListModel;

  Future<Map<String, dynamic>> _loadPageAsset() async {
    // return await rootBundle.loadString('assets/Json/adminPool.json');
    String mobile = await LocalStorage.getMobile();
    mobile = mobile.substring(1, mobile.length);
    return await NetworkCalls.getDataFromServer(
        key: listOfCreatedPoolsScaffoldKey,
        endPoint: EndPoints.createdPoolsList + mobile,
        authRequest: true);
  }

  Future<Null> loadPage() async {
    // try {
    //   LoaderDialog.loaderDialog(listOfCreatedPoolsScaffoldKey.currentContext);
    // } catch (e) {
    //   print("Error At Login Provider in Loader Dialog!");
    //   throw Exception(e);
    // }

    await _loadPageAsset().then((q) {
      if (q["status"]) {
        print(q["body"]);
        poolListModel = PoolListModel.fromJson(q["body"]["poolDetails"]);
        // print(poolListModel.poolDataModel[0].imageModel[0].name);
        // print(poolListModel.poolDataModel.length);
      }
    });
    // await Future.delayed(Duration(seconds: 4));
    return null;
  }
}
