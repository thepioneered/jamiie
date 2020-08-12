import 'dart:io';
import 'package:flutter/services.dart';
import 'providers/Dashboard/dashboardProvider.dart';
import 'providers/auth/forgotPassword/FPotpProvider.dart';
import 'providers/auth/forgotPassword/FPmobileProvider.dart';
import 'screens/auth/forgotPassword/FPnewpassPage.dart';
import 'package:jamiee_flutter/src/screens/auth/singup/mobilePage.dart';
import 'package:jamiee_flutter/src/screens/auth/singup/otpPage.dart';
import 'package:jamiee_flutter/src/screens/auth/singup/signupPage.dart';
import 'package:jamiee_flutter/src/screens/navbar.dart';
import 'package:jamiee_flutter/src/screens/settings/settingPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './providers/app/appProvider.dart';
import 'providers/auth/forgotPassword/FPnewPasswordProvider.dart';
import 'providers/auth/login/loginProvider.dart';
import 'providers/auth/signup/mobileProvider.dart';
import 'providers/auth/signup/otpProvider.dart';
import 'providers/auth/signup/signupProvider.dart';
import './styles/colors.dart';
import './routes/routes.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // @override
  // void initState() {
  //   final _firebaseMessanging = FirebaseMessaging();
  //   _firebaseMessanging.requestNotificationPermissions();
  //   _firebaseMessanging.configure(

  //     onMessage: (Map<String, Object> q) {
  //       print("$q onMessage");
  //       return;
  //     },
  //     onLaunch: (Map<String, Object> q) {
  //       print("$q onLaunch");
  //       return;
  //     },
  //     onResume: (Map<String, Object> q) {
  //       print("$q onResume");
  //       return;
  //     },
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        //App Provider which checks whether session logged in or not
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),

        //All auth Providers
        ChangeNotifierProvider(
          create: (context) => MobileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordOtpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewPasswordProvider(),
        ),

        //Dashboard Provider
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
      ],
      child: PlatformApp(),
    );
  }
}

class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        onGenerateRoute: AppRoutes.cupertinoPageRoute,
      );
    } else {
      var appProvider = Provider.of<AppProvider>(context);
      return MaterialApp(
        title: "Jamiee",
        theme: ThemeData(
          primaryColor: AppColors.primaryColorPurple,
          accentColor: AppColors.primaryColorPurple,
        ),
        onGenerateRoute: AppRoutes.materialPageRoute,
        // home: SignupPage(),
        home: appProvider.child,
        debugShowCheckedModeBanner: true,
      );
    }
  }
}
