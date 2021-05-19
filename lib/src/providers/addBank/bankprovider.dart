import '../../models/auth/mobileModel.dart';
import '../../models/base/pageModel.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
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
    } else {
      firstTimeAddBank = false;
      isNetworkCallCompleted = true;
      Future.delayed(Duration(milliseconds: 500), () {
            Navigator.pushReplacementNamed(
                scaffoldKey.currentContext, "/NavBar");
          });
      notifyListeners();
      return Future.error(405);
    }
  }
}
