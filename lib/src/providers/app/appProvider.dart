import 'package:Jamiie/src/screens/AfterLoginForm/form.dart';
import 'package:Jamiie/src/screens/auth/completeProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        case PageType.CompleteProfilePage:
          child = CompleteProfilePage();
          break;
        default:
          child = LoginPage();
          break;
      }
      notifyListeners();
    });
  }

  Future<PageType> checkSession() async {
    String value = await LocalStorage.getToken();
    print("+++++++++++++++++$value++++++++++++++++++++");
    if (value != null) {
      bool isProfileComplete = await LocalStorage.isProfileComplete();
      bool isRiskCalculated = await LocalStorage.isRiskCalculated();
      if (isProfileComplete && isRiskCalculated) {
        return PageType.AppNavigationBar;
      } else if (isProfileComplete && !isRiskCalculated) {
        return PageType.AfterLoginForm;
      } else if (!isProfileComplete && !isRiskCalculated) {
        return PageType.CompleteProfilePage;
      } else {
        return PageType.LoginPage;
      }
    } else {
      return PageType.LoginPage;
    }
  }
}

enum PageType {
  LoginPage,
  AppNavigationBar,
  AfterLoginForm,
  CompleteProfilePage
}
