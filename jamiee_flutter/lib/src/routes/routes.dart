import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/screens/auth/otpPage.dart';
import 'package:jamiee_flutter/src/screens/auth/signupPage.dart';
import 'package:jamiee_flutter/src/screens/navbar.dart';
import 'package:jamiee_flutter/src/screens/settings/editprofilePage.dart';
import 'package:jamiee_flutter/src/screens/splashscreen/splashScreen.dart';
import '../screens/settings/aboutusPage.dart';
import 'package:provider/provider.dart';
import "../screens/settings/contactPage.dart";
import '../providers/faqData.dart';
import '../screens/settings/faqPage.dart';
import '../screens/dashboard.dart';
import '../screens/HomePage.dart';

class AppRoutes {
  static MaterialPageRoute materialPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/HomePage":
        return MaterialPageRoute(
          builder: (context) => SplashScreenPage(),
        );
      case "/NavBar":
        return MaterialPageRoute(
          builder: (context) => AppNavigationBar(),
        );
      case "/DashboardPage":
        return MaterialPageRoute(
          // builder: (context) => DashboardPagePlatform(),
          builder: (context) => MainPage(),
        );
      case "/FaqPage":
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => FaqData(), child: FaqPage()),
        );

      case "/ContactPage":
        return MaterialPageRoute(
          builder: (context) => ContactPage(),
        );
      case "/SignupPage":
        return MaterialPageRoute(
          builder: (context) => SignupPage(),
        );

      case "/AboutusPage":
        return MaterialPageRoute(
          builder: (context) => AboutusPage(),
        );

      case "/EditprofilePage":
        return MaterialPageRoute(
          builder: (context) => EditprofilePage(),
        );
      case "/OtpPage":
        return MaterialPageRoute(
          builder: (context) => OtpPage(),
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
      case "/DashboardPage":
        return CupertinoPageRoute(
            // builder: (context) => DashboardPagePlatform(),
            );
      default:
        return CupertinoPageRoute(
          builder: (context) => HomePagePlatform(),
        );
    }
  }
}
