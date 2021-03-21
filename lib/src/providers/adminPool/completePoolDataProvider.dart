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
        showSnackBar: false,
        endPoint: EndPoints.completePoolData + poolId,
        authRequest: true);
    print(data);

    if (data['status']) {
      print(data["body"]);
      completePoolDataModel = CompletePoolDataModel.formJson(data["body"]);
      // completePoolDataModel = CompletePoolDataModel.fromJson(data["body"]);
      // return null;
      Map<String, dynamic> response = await NetworkCalls.getDataFromServer(
        key: completePoolDataScaffoldKey,
        endPoint: EndPoints.payButtonLogic,
        shouldPagePop: false,
        authRequest: true
      );
      if (response["status"]) {
        if (response["body"]["payButton"]) {
          payButton = true;
          // notifyListeners();
          return null;
        }
      }
      // print(completePoolDataModel.deadline);
      // print(completePoolDataModel.members[0].memberDetails.imageURL);
    }
  }
}
