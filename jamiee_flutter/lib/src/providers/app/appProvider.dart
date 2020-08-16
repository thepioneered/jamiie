import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../screens/navbar.dart';
import '../../screens/auth/login/loginPage.dart';
import '../../utils/sharedPref.dart';

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
        child = AppNavigationBar();
      } else {
        child = LoginPage();
      }
      notifyListeners();
    });
  }

  Future<String> checkSession() async {
    String value = await LocalStorage.getToken();
    print(await LocalStorage.getMobile());
    print("+++++++++++++++++$value++++++++++++++++++++");
    return value;
  }
}
