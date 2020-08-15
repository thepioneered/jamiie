import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './providers/AfterLoginForm/formProvider.dart';
import 'providers/adminPool/createPoolProvider.dart';
import 'providers/Dashboard/dashboardProvider.dart';
import 'providers/auth/forgotPassword/FPotpProvider.dart';
import 'providers/app/appProvider.dart';
import 'providers/auth/login/loginProvider.dart';
import 'providers/auth/signup/mobileProvider.dart';
import 'providers/auth/signup/otpProvider.dart';
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
          create: (context) => LoginProvider(),
        ),


        //Forgot Password Provider
        // ChangeNotifierProvider(
          
        // ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordOtpProvider(),
        ),
        //TODO NEW PASSWORD REMOVED FROM HERE

        ChangeNotifierProvider(
          create: (_) => CreatePoolProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FormProvider(),
        ),
        //Dashboard Provider
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Jamiie",
        theme: ThemeData(
          primaryColor: AppColors.primaryColorPurple,
          accentColor: AppColors.primaryColorPurple,
        ),
        onGenerateRoute: AppRoutes.materialPageRoute,
        // home: AfterLoginFormPage(),
        home: Consumer<AppProvider>(
          builder: (_, appProvider, child) {
            return appProvider.child;
          },
        ),
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
