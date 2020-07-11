import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/screens/dashboard.dart';
import './routes/routes.dart';
import 'dart:io';
import './screens/homePage.dart';


class App extends StatelessWidget {
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
        onGenerateRoute: AppRoutes.materialPageRoute,
        home: HomePagePlatform(), //TODO:EDIT HOME PAGE HERE LATER
        debugShowCheckedModeBanner: true,
      );
    }
  }
}
