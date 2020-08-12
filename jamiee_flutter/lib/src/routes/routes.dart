import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/screens/auth/forgotPassword/forgotPassword.dart';
import 'package:jamiee_flutter/src/screens/auth/forgotPassword/FPnewpassPage.dart';
import 'package:jamiee_flutter/src/screens/auth/forgotPassword/otpPage.dart';
import 'package:provider/provider.dart';
import '../providers/auth/login/loginProvider.dart';
import '../screens/auth/singup/mobilePage.dart';
import '../screens/auth/singup/otpPage.dart';
import '../screens/auth/singup/signupPage.dart';
import '../screens/navbar.dart';
import '../screens/settings/editprofilePage.dart';
import '../screens/auth/login/loginPage.dart';
import '../screens/settings/aboutusPage.dart';
import "../screens/settings/contactPage.dart";
import '../providers/settings/faqData.dart';
import '../screens/settings/faqPage.dart';
import '../screens/Dashboard/dashboard.dart';

class AppRoutes {
  static MaterialPageRoute materialPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/NavBar":
        return MaterialPageRoute(
          builder: (context) => AppNavigationBar(),
        );
      case "/DashboardPage":
        return MaterialPageRoute(
          builder: (context) => DashboardPage(),
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
      case "/ForgotPasswordPage":
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordPage(),
        );
      case "/FPOtpPage":
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordOtpPage(),
        );
      case "/FPNewPassword":
        return MaterialPageRoute(
          builder: (context) => NewPasswordPage(),
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
