import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/text.dart';
import '../utils/icons.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 25.0, right: 20.0, left: 20.0, bottom: 20.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: Text("Check"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 50.0,
              // color: Colors.black,
              child: Row(
                children: <Widget>[
                  AppIcons.logoutIcon,
                  SizedBox(
                    width: 15.0,
                  ),
                  Text("Logout",
                      style: AppTextStyle.tabText(AppColors.primaryOrange)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
