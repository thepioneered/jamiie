import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../utils/icons.dart';
import '../widgets/drawer.dart';
import '../styles/base.dart';

class DashboardPagePlatform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: DashboardPage(
          previousContext: context,
        ),
      );
    } else {
      return Scaffold(
        drawer: Drawer(
          child: AppDrawer(),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: DashboardPage(
          previousContext: context,
        ),
      );
    }
  }
}

class DashboardPage extends StatelessWidget {
  final BuildContext previousContext;

  const DashboardPage({@required this.previousContext});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: BaseStyles.pagePadingDashboard,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: AppIcons.barsIcon,
                    color: Colors.black,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
