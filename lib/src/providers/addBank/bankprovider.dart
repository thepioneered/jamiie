import 'package:Jamiie/src/models/auth/mobileModel.dart';
import 'package:Jamiie/src/models/base/pageModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';

class BankProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String url;
  MobileModel mobileModel;
  PageModel pageModel;
  bool firstTimeAddBank;
  bool isNetworkCallCompleted;
  BankProvider({
    this.firstTimeAddBank = false,
    this.isNetworkCallCompleted = false,
  });

  Future<Null> loadPage(String mobile) async {
    mobileModel = MobileModel();
    mobileModel.mobile = mobile;

    Map<String, dynamic> response = await NetworkCalls.postDataToServer(
        key: scaffoldKey,
        endPoint: EndPoints.bankVerification,
        afterRequest: () {},
        shouldPagePop: false,
        authRequest: true,
        showSnackBar: false,
        body: mobileModel.toJson());
    print(response);
    if (response["status"]) {
      firstTimeAddBank = true;
      isNetworkCallCompleted = true;
      notifyListeners();
      return null;
      //Show krdo bank ko
    } else {
      // Bank already added hai
      firstTimeAddBank = false;
      isNetworkCallCompleted = true;
      notifyListeners();
      return Future.error(405);
    }
  }
}
