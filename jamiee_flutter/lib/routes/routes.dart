import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/screens/loginPage.dart';

class AppRoutes {
  static MaterialPageRoute materialPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/loginPage":
        return MaterialPageRoute(
          builder: (context) => LoginPagePlatform(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => LoginPagePlatform(),
        );
    }
  }

  static CupertinoPageRoute cupertinoPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/loginPage":
        return CupertinoPageRoute(
          builder: (context) => LoginPagePlatform(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => LoginPagePlatform(),
        );
    }
  }
}
