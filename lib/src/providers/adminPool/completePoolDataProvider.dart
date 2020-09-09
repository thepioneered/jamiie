import 'package:Jamiie/src/models/adminPoolModel/completePoolDataModel.dart';
import 'package:Jamiie/src/models/base/pageModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:flutter/material.dart';

class CompletePoolDataProvider with ChangeNotifier {
  final completePoolDataScaffoldKey = GlobalKey<ScaffoldState>();
  PageModel pageModel;
  CompletePoolDataModel completePoolDataModel;

  Future<Null> loadPage(String poolId) async {
    print("getting dataa");
    print(poolId);
    Map<String, dynamic> data = await NetworkCalls.getDataFromServer(
        key: completePoolDataScaffoldKey,
        endPoint: EndPoints.completePoolData + poolId,
        authRequest: true);
    print(data);

    if (data['status']) {
      print(data["body"]);
      completePoolDataModel = CompletePoolDataModel.formJson(data["body"]);
     return null;
      // print(completePoolDataModel.deadline);
      // print(completePoolDataModel.members[0].memberDetails.imageURL);
    }
  }
}
