import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/adminPool/adminPoolPage.dart';
import '../styles/colors.dart';
import 'Dashboard/dashboard.dart';
import 'settings/settingPage.dart';
import 'userJoinedPools/joinedPoolListPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNavigationBar extends StatefulWidget {
  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
  
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  
  int index = 0;
  final List<Object> _pages = <Object>[
    DashboardPage(),
    MyPool(),
    AdminPoolPage(),
    SettingPage(),
  ];

  Widget _bottomNavigationBar(double height) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      height: height,
      width: 1.wp,
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
      decoration: null,
      width: 1.wp / 4,
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (index != _index)
            setState(() {
              index = _index;
            });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              color: index == _index
                  ? AppColors.primaryColorPurple
                  : AppColors.grayInputHeading,
            ),
            index == _index
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5.0.h,
                      ),
                      Text(
                        title,
                        style: TextStyle(color: AppColors.primaryColorPurple),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _navbarImageButton(int _index) {
    return Container(
      width: 1.wp / 4,
      child: FlatButton(
        onPressed: () {
          if (index != _index)
            setState(() {
              index = _index;
            });
        },
        child: Container(
          margin: EdgeInsets.all(12.0.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1.0.w, color: AppColors.primaryColorPurple),
            image: DecorationImage(
                image: AssetImage("assets/logo3.png"), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    return Scaffold(
      body: _pages.elementAt(index),
      
      //8 percent of total height
      bottomNavigationBar: _bottomNavigationBar(
         0.08.hp+5.h,
      ),
    );
  }
}
