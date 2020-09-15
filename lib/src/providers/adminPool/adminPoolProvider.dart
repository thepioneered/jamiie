import 'package:Jamiie/src/models/adminPoolModel/poolListModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';

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
    String mobile = await LocalStorage.getMobile();
    mobile = mobile.substring(1, mobile.length);

    //Network Calls
    Map<String, dynamic> data = await NetworkCalls.getDataFromServer(
      shouldPagePop: false,
      key: listOfCreatedPoolsScaffoldKey,
      endPoint: EndPoints.createdPoolsList + mobile,
      authRequest: true,
    );
    print(data);

    if (data["status"]) {
      var q = data["body"]["poolDetails"] as List;
      if (q.isEmpty) {
        return Future.error(404);
      } else {
        poolListModel = PoolListModel.fromJson(data["body"]["poolDetails"]);
      }
    }
  }
}
