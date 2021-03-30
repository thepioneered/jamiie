import '../screens/auth/afterLogin/completeProfilePage.dart';
import '../screens/adminPool/creatPool.dart';
import '../screens/userJoinedPools/searchPoolPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/auth/afterLogin/form.dart';
import '../screens/auth/forgotPassword/forgotPassword.dart';
import '../screens/auth/forgotPassword/FPnewpassPage.dart';
import '../screens/auth/forgotPassword/otpPage.dart';
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
      case "/CompleteProfilePage":
        return MaterialPageRoute(
          builder: (context) => CompleteProfilePage(),
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
      case "/AfterLoginFormPage":
        return MaterialPageRoute(
          builder: (context) => AfterLoginFormPage(),
        );
      case "/SearchPoolPage":
        return MaterialPageRoute(
          builder: (context) => SearchPoolPage(),
        );
      

      case "/CreatePoolPage":
        return MaterialPageRoute(
          builder: (context) => CreatePoolPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
    }
  }
}

//If pool not started
// var q = {
//   "poolAmount": "Amount",
//   "totalMembers": 10,
//   "poolDetails": [
//     {"memberName": "Nakul", "imageUrl": "Bucket url", "riskScore": "riskScore"},
//     {"memberName": "Nakul", "imageUrl": "Bucket url", "riskScore": "riskScore"}
//   ]
// };
