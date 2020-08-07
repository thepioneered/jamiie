import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth/loginProvider.dart';
import '../screens/auth/mobilePage.dart';
import '../screens/auth/otpPage.dart';
import '../screens/auth/signupPage.dart';
import '../screens/navbar.dart';
import '../screens/settings/editprofilePage.dart';
import '../screens/auth/loginPage.dart';
import '../screens/settings/aboutusPage.dart';
import "../screens/settings/contactPage.dart";
import '../providers/settings/faqData.dart';
import '../screens/settings/faqPage.dart';
import '../screens/dashboard.dart';

class AppRoutes {
  static MaterialPageRoute materialPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/NavBar":
        return MaterialPageRoute(
          builder: (context) => AppNavigationBar(),
        );
      case "/DashboardPage":
        return MaterialPageRoute(
          builder: (context) => MainPage(),
        );
      case "/LoginPage":
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => LoginProvider(),
            child: LoginPage(),
          ),
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
      case "/MobilePage":
        return MaterialPageRoute(
          builder: (context) => MobilePage(),
        );
      case "/OtpPage":
        return MaterialPageRoute(
          builder: (context) => OtpPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
    }
  }

  static CupertinoPageRoute cupertinoPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/LoginPage":
        return CupertinoPageRoute(
          builder: (context) => LoginPage(),
        );
      default:
        return CupertinoPageRoute(builder: (context) => LoginPage());
    }
  }
}
