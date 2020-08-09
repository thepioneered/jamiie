import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import '../screens/dashboard.dart';
// import 'myPoolUser/myPoolUser.dart';
import '../screens/page3.dart';
import 'settings/settingPage.dart';

int index = 0;

class AppNavigationBar extends StatefulWidget {
  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  final List<Object> _pages = <Object>[
    // DashboardPagePlatform(),
    MainPage(),
    // MyPool(),
    UserPool(),
    SettingPage(),
  ];

  Widget _bottomNavigationBar() {
    return Container(
      color: AppColors.white,
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Row(
          children: <Widget>[
            _check(),
            // _check(),
            // _check(),
            // _check(),
          ],
        ),
      ),
    );
  }

  FlatButton _check() {
    return FlatButton(
      onPressed: () {
        // print(MediaQuery.of(context).size)
        print("Buttom Nav Bar");
      },
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          height: 60.0,
          width: MediaQuery.of(context).size.width / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.home),
              Text("Home"),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(index),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
