import 'package:Jamiie/src/models/base/pageModel.dart';
import 'package:Jamiie/src/models/userJoinedPools/joinPoolDataModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:flutter/material.dart';

class JoinPoolDataProvider with ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PageModel pageModel;
  JoinPoolDataModel joinPoolDataModel;

  Future<Null> loadPage(String poolId) async {
    print("-----------getting dataa of join pool----------");
    print(poolId);
    Map<String, dynamic> data = await NetworkCalls.getDataFromServer(
        shouldPagePop: false,
        key: scaffoldKey,
        endPoint: EndPoints.completePoolData + poolId,
        authRequest: true);
    print(data);

    if (data['status']) {
      print(data["body"]);
      joinPoolDataModel = JoinPoolDataModel.formJson(data["body"]);
      return null;
    }
  }
}
