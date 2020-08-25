import 'package:Jamiie/src/screens/auth/completeProfilePage.dart';
import 'package:Jamiie/src/screens/auth/login/loginPage.dart';
import 'package:Jamiie/src/screens/auth/singup/mobilePage.dart';
import 'package:Jamiie/src/screens/auth/singup/otpPage.dart';
import 'package:Jamiie/src/screens/auth/singup/signupPage.dart';
import 'package:Jamiie/src/screens/navbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'providers/Dashboard/dashboardProvider.dart';
import 'providers/app/appProvider.dart';
import 'providers/auth/login/loginProvider.dart';
import './styles/colors.dart';
import './routes/routes.dart';
import 'screens/AfterLoginForm/form.dart';
import 'screens/AfterLoginForm/form2.dart';
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
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Jamiie",
        theme: ThemeData(
          primaryColor: AppColors.primaryColorPurple,
        ),
        onGenerateRoute: AppRoutes.materialPageRoute,
        home: CompleteProfilePage(),
        // home: Consumer<AppProvider>(
        //   builder: (_, appProvider, child) {
        //     return appProvider.child;
        //   },
        // ),
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
