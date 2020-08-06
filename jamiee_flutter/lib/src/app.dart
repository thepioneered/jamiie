import 'dart:io';
import 'package:jamiee_flutter/src/providers/appProvider.dart';
import 'package:jamiee_flutter/src/screens/auth/loginPage.dart';
import 'package:jamiee_flutter/src/screens/auth/mobilePage.dart';
import 'package:jamiee_flutter/src/screens/auth/otpPage.dart';
import 'package:jamiee_flutter/src/screens/splashscreen/chooseSignIn.dart';
import 'package:jamiee_flutter/src/utils/sharedPref.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './providers/auth/loginProvider.dart';
import './providers/auth/mobileProvider.dart';
import './providers/auth/otpProvider.dart';
import './providers/auth/signupProvider.dart';
import './providers/passwordVisible.dart';
import './screens/auth/signupPage.dart';
import './styles/colors.dart';
import './routes/routes.dart';
import 'screens/splashscreen/splashScreen.dart';
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
        create: (context) => AppProvider(),
      ),
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
      var appProvider = Provider.of<AppProvider>(context);
      return MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.primaryColorLight,
          accentColor: AppColors.primaryColorLight,
          // primarySwatch: MaterialColor()
        ),
        onGenerateRoute: AppRoutes.materialPageRoute,
        home: ChooseSignInPage(),
        // home: appProvider.child,
        debugShowCheckedModeBanner: true,
      );
    }
  }
}
//checking
