import 'package:Jamiie/src/models/userJoinedPools/joinPoolListModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';

class JoinPoolProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> listOfJoinedPoolScaffoldKey =
      GlobalKey<ScaffoldState>();
  JoinPoolListModel joinPoolListModel;

  Future<Null> loadPageAsset() async {
    // await loadJson().then((value) {
    //   Map<String, dynamic> val = json.decode(value);
    //   // print(val);
    //   joinPoolListModel = JoinPoolListModel.fromJson(val);
    //   //print(joinPoolListModel.joinPoolListDataModel[0].poolName);
    //   return null;
    // });

    String mobile = await LocalStorage.getMobile();
    mobile = mobile.substring(1, mobile.length);
    print(EndPoints.joinedPoolList + mobile);

    Map<String, dynamic> data = await NetworkCalls.getDataFromServer(
      key: listOfJoinedPoolScaffoldKey,
      endPoint: EndPoints.joinedPoolList + mobile,
      shouldPagePop: false,
      authRequest: true
    );
    print(data);

    if (data["status"]) {
      joinPoolListModel = JoinPoolListModel.fromJson(data["body"]);
    } else {
      return Future.error(404);
    }
  }

  // Future<String> loadJson() async {
  //   return await rootBundle.loadString('assets/Json/joinPool.json');
  // }
}
