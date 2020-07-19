import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:provider/provider.dart';
import '../screens/dashboard.dart';
import 'myPoolUser/myPoolUser.dart';
import '../screens/page3.dart';
import 'settings/settingPage.dart';

int index = 0;

class AppNavigationBar extends StatefulWidget {
  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  final List<Object> _pages = <Object>[
    DashboardPagePlatform(),
    MyPool(),
    UserPool(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15.0,
        currentIndex: index,
        fixedColor: AppColors.primaryBlue,
        backgroundColor: AppColors.white,
        unselectedItemColor: AppColors.grayInputHeading,
        onTap: (value) {
          if (value != index)
            setState(() {
              index = value;
            });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text("Dashboard"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("Your Pool"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Pool"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Setting"),
          ),
        ],
      ),
    );
  }
}
