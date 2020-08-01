import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/auth/mobileProvider.dart';
import 'package:jamiee_flutter/src/providers/auth/otpProvider.dart';
import 'package:jamiee_flutter/src/providers/passwordVisible.dart';
import 'package:jamiee_flutter/src/screens/auth/mobilePage.dart';
import 'package:jamiee_flutter/src/screens/auth/otpPage.dart';
import 'package:jamiee_flutter/src/screens/dashboard.dart';
import 'package:jamiee_flutter/src/screens/navbar.dart';
import 'package:jamiee_flutter/src/providers/faqData.dart';
import 'package:jamiee_flutter/src/screens/splashscreen/splashScreen.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:provider/provider.dart';
import './routes/routes.dart';
import 'dart:io';
import './screens/homePage.dart';
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
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => PasswordStatus(),
      ),
      ChangeNotifierProvider(
        create: (context) => MobileProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => OtpProvider(),
      ),
    ], child: PlatformApp());
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
      return MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.primaryColorLight,
          accentColor: AppColors.primaryColorLight,
          // primarySwatch: MaterialColor()
        ),
        onGenerateRoute: AppRoutes.materialPageRoute,
        home: MobilePage(),
        // home: AppNavigationBar(),
        debugShowCheckedModeBanner: true,
      );
    }
  }
}
//checking
