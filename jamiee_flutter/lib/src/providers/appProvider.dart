import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/screens/auth/mobilePage.dart';
import 'package:jamiee_flutter/src/screens/splashscreen/chooseSignIn.dart';
import 'package:jamiee_flutter/src/utils/sharedPref.dart';

class AppProvider extends ChangeNotifier {
  Widget child;
  String token;
  AppProvider() {
    child = MaterialApp(
      home: Scaffold(
        body: Center(child: CupertinoActivityIndicator()),
      ),
    );
    getToken();
  }

  void getToken() {
    checkSession().then((value) {
      if (value != null) {
        child = MobilePage();
      } else {
        child = ChooseSignInPage();
      }
      notifyListeners();
    });
  }
  

  Future<String> checkSession() async {
    String value = await LocalStorage().getToken();
    print("+++++++++++++++++$value++++++++++++++++++++");
    return value;
  }
}
