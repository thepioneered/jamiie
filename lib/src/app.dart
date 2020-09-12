
import 'package:Jamiie/src/screens/adminPool/creatPool.dart';
import 'package:Jamiie/src/screens/auth/afterLogin/completeProfilePage.dart';
import 'package:Jamiie/src/screens/auth/forgotPassword/FPnewpassPage.dart';
import 'package:Jamiie/src/screens/auth/forgotPassword/otpPage.dart';
import 'package:Jamiie/src/screens/auth/login/loginPage.dart';
import 'package:Jamiie/src/screens/auth/singup/mobilePage.dart';
import 'package:Jamiie/src/screens/auth/singup/signupPage.dart';
import 'package:Jamiie/src/screens/navbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'providers/app/appProvider.dart';
import 'providers/auth/login/loginProvider.dart';
import './styles/colors.dart';
import './routes/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  void token(FirebaseMessaging _firebaseMessanging) async {
    var q = await _firebaseMessanging.getToken();

    print(q);
  }

  @override
  void initState() {
    final _firebaseMessanging = FirebaseMessaging();

    _firebaseMessanging.requestNotificationPermissions();
    try {
      token(_firebaseMessanging);
    } catch (e) {
      print("token not found");
    }
    _firebaseMessanging.configure(
      onMessage: (Map<String, dynamic> q) {
        print("$q onMessage");
        print(q["data"]["path"]);
        Navigator.pushNamed(context, q["data"]["path"]);
        // Map<String,dynamic>data = json.decode(q.toString());
        // print(data);
        // print(data["data"]);
        return;
      },
      onLaunch: (Map<String, Object> q) {
        print("$q onLaunch");
        return;
      },
      onResume: (Map<String, dynamic> q) {
        print("$q onResume");

        return;
      },
    );
    super.initState();
  }

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
      ],
      child: MaterialApp(
        title: "Jamiie",
        theme: ThemeData(
          primaryColor: AppColors.primaryColorPurple,
        ),
        onGenerateRoute: AppRoutes.materialPageRoute,

        //home: SignupPage(),
        // home:MobilePage(),

        //home: CompleteProfilePage(),

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
