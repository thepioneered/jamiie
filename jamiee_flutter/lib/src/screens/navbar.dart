import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'Dashboard/dashboard.dart';
import '../screens/page3.dart';
import 'settings/settingPage.dart';
import 'userPoolScreens/myPoolUser.dart';

class AppNavigationBar extends StatefulWidget {
  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int index = 0;
  final List<Object> _pages = <Object>[
    DashboardPage(),
    MyPool(),
    UserPool(),
    SettingPage(),
  ];

  Widget _bottomNavigationBar() {
    return Container(
      color: AppColors.white,
      height: 55.0,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _navbarButton(0, "Home", FontAwesomeIcons.home),
            _navbarButton(1, "My pools", FontAwesomeIcons.peopleArrows),
            _navbarButton(2, "Create Pool", FontAwesomeIcons.edit),
            _navbarImageButton(3),
          ],
        ),
      ),
    );
  }

  Widget _navbarButton(int _index, String title, IconData iconData) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (index != _index)
            setState(() {
              index = _index;
            });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              iconData,
              color: AppColors.primaryColorLight,
            ),
            Text(
              title,
              style: TextStyle(color: AppColors.primaryColorLight),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navbarImageButton(int _index) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      child: FlatButton(
        onPressed: () {
          if (index != _index)
            setState(() {
              index = _index;
            });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage("assets/logo3.png"), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("State is set");
    return Scaffold(
      body: _pages.elementAt(index),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
