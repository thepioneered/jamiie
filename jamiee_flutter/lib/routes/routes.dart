import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/screens/HomePage.dart';

class AppRoutes {
  static MaterialPageRoute materialPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/HomePage":
        return MaterialPageRoute(
          builder: (context) => HomePagePlatform(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => HomePagePlatform(),
        );
    }
  }

  static CupertinoPageRoute cupertinoPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/HomePage":
        return CupertinoPageRoute(
          builder: (context) => HomePagePlatform(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => HomePagePlatform(),
        );
    }
  }
}
