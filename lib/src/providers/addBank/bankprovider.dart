import 'package:Jamiie/src/models/auth/mobileModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';

class BankProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String url;
  MobileModel mobileModel;

  Future<Null> loadPage() async {
    String _mobile = await LocalStorage.getMobile();
    _mobile = _mobile.substring(1, _mobile.length);
    url = 'https://jamiie.anukai.com/payments/bank/' + _mobile;
    mobileModel = MobileModel();
    mobileModel.mobile = _mobile;

    Map<String, dynamic> response = await NetworkCalls.postDataToServer(
        key: scaffoldKey,
        endPoint: EndPoints.bankVerification,
        afterRequest: () {},
        shouldPagePop: false,
        authRequest: true,
        showSnackBar: false,
        body: mobileModel.toJson());
    if(response["status"]){
      return null;
      //Show krdo bank ko
    }
    else{
      // Bank already added hai
      return Future.error(405);
    }
  }
}
