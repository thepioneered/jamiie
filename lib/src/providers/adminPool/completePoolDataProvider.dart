import 'package:Jamiie/src/models/adminPoolModel/completePoolDataModel.dart';
import 'package:Jamiie/src/models/base/pageModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:flutter/material.dart';

class CompletePoolDataProvider with ChangeNotifier {
  final completePoolDataScaffoldKey = GlobalKey<ScaffoldState>();
  PageModel pageModel;
  CompletePoolDataModel completePoolDataModel;
  bool payButton = false;

  Future<Null> payButtonLogin() async {
    // Map<String, dynamic> data = await NetworkCalls.getDataFromServer(
    //   key: completePoolDataScaffoldKey,
    //   endPoint: EndPoints.payButtonLogic,
    //   shouldPagePop: false,
    // );
    // if (data["status"]) {
    //   if (data["body"]["payButton"]) {
    //     payButton = true;
    //     notifyListeners();
    //   }
    // }
  }

  Future<Null> loadPage(String poolId) async {
    Map<String, dynamic> data = await NetworkCalls.getDataFromServer(
        shouldPagePop: false,
        key: completePoolDataScaffoldKey,
        endPoint: EndPoints.completePoolData + poolId,
        authRequest: true);
    print(data);

    if (data['status']) {
      print(data["body"]);
      completePoolDataModel = CompletePoolDataModel.formJson(data["body"]);
      print("22222222222222");
      print(completePoolDataModel.startStatus);
      }
  }
}
