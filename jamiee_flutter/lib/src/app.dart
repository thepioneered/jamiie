import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/screens/dashboard.dart';
import 'package:jamiee_flutter/src/screens/navbar.dart';
import 'package:jamiee_flutter/src/providers/faqData.dart';
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
    return PlatformApp();
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
        theme: ThemeData(primaryColor: AppColors.primaryBlue),
        onGenerateRoute: AppRoutes.materialPageRoute,
        home: MultiProvider(
          providers: [
            Provider(create: (conntext) => FaqData()),
            ChangeNotifierProvider(
              create: (ctx) => FaqData(),
            )
          ],
          child: AppNavigationBar(),
        ), //TODO:EDIT HOME PAGE HERE LATER
        debugShowCheckedModeBanner: true,
      );
    }
  }
}
