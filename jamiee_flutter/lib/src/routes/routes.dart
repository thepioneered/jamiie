import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/faqData.dart';
import 'package:provider/provider.dart';
import '../screens/settings/contactPage.dart';
import '../screens/settings/faqPage.dart';
import '../screens/dashboard.dart';
import '../screens/HomePage.dart';

class AppRoutes {
  static MaterialPageRoute materialPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/HomePage":
        return MaterialPageRoute(
          builder: (context) => HomePagePlatform(),
        );
      case "/DashboardPage":
        return MaterialPageRoute(
          builder: (context) => DashboardPagePlatform(),
        );
      case "/FaqPage":
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => FaqData(), child: FaqPage()),
        );
        break;
      case "/ContactPage":
        return MaterialPageRoute(
          builder: (context) => ContactPage(),
        );
        break;
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
      case "/DashboardPage":
        return CupertinoPageRoute(
          builder: (context) => DashboardPagePlatform(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => HomePagePlatform(),
        );
    }
  }
}
