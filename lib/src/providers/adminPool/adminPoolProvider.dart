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

  // Future<Map<String, dynamic>> _loadPageAsset() async {
  //   // return await rootBundle.loadString('assets/Json/adminPool.json');
  //   String mobile = await LocalStorage.getMobile();
  //   mobile = mobile.substring(1, mobile.length);
  //       key: listOfCreatedPoolsScaffoldKey,
  //       endPoint: EndPoints.createdPoolsList + mobile,
  //       authRequest: true);
  // }

  Future<Null> loadPage() async {
    // try {
    //   LoaderDialog.loaderDialog(
    //       listOfCreatedPoolsScaffoldKey.currentContext);
    // } catch (e) {
    //   throw Exception(e);
    // }
    String mobile = await LocalStorage.getMobile();
    mobile = mobile.substring(1, mobile.length);
    Map<String, dynamic> data = await NetworkCalls.getDataFromServer(
        key: listOfCreatedPoolsScaffoldKey,
        endPoint: EndPoints.createdPoolsList + mobile,
        authRequest: true);

    if (data["status"]) {
      print(data["body"]);
      poolListModel = PoolListModel.fromJson(data["body"]["poolDetails"]);
    }
  }
}
