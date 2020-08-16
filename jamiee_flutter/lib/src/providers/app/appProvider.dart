import 'package:Jamiie/src/screens/AfterLoginForm/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../screens/navbar.dart';
import '../../screens/auth/login/loginPage.dart';
import '../../utils/sharedPref.dart';

class AppProvider extends ChangeNotifier {
  Widget child;
  String token;
  PageType pageType;

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
      switch (value) {
        case PageType.LoginPage:
          child = LoginPage();
          break;
        case PageType.AfterLoginForm:
          child = AfterLoginFormPage();
          break;
        case PageType.AppNavigationBar:
          child = AppNavigationBar();
          break;
        default:
          child = LoginPage();
          break;
      }
      // if (value != null) {
      //   child = AppNavigationBar();
      // } else {
      //   child = LoginPage();
      // }
      notifyListeners();
    });
  }

  Future<PageType> checkSession() async {
    String value = await LocalStorage.getToken();
    bool status = await LocalStorage.getFirstLogin();
    print("+++++++++++++++++$value++++++++++++++++++++");
    if (value != null) {
      if (status == false) {
        return PageType.AfterLoginForm;
      } else {
        return PageType.AppNavigationBar;
      }
    } else {
      return PageType.LoginPage;
    }
  }
}

enum PageType { LoginPage, AppNavigationBar, AfterLoginForm }
