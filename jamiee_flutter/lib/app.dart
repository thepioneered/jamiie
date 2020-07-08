import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/routes/routes.dart';
import 'package:jamiee_flutter/screens/homePage.dart';
import 'package:jamiee_flutter/screens/loginPage.dart';

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
        home: HomePagePlatform(),
      );
    }
  }
}
