import 'dart:io';
import 'package:flutter/services.dart';
import 'package:jamiee_flutter/src/providers/Dashboard/dashboardProvider.dart';
import 'package:jamiee_flutter/src/screens/navbar.dart';
import 'package:jamiee_flutter/src/screens/settings/settingPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './providers/app/appProvider.dart';
import './providers/auth/loginProvider.dart';
import './providers/auth/mobileProvider.dart';
import './providers/auth/otpProvider.dart';
import './providers/auth/signupProvider.dart';
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
          primaryColor: AppColors.primaryColorLight,
          accentColor: AppColors.primaryColorLight,
        ),
        onGenerateRoute: AppRoutes.materialPageRoute,
        // home: AppNavigationBar(),
        home: appProvider.child,
        debugShowCheckedModeBanner: true,
      );
    }
  }
}
