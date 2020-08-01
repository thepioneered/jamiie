import "package:flutter/material.dart";
import '../../styles/text.dart';
import '../../styles/colors.dart';

void appLogoutDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          actionsPadding: EdgeInsets.only(right: 5.0),
          title: Text(
            "Are you sure you want to logout?",
            style: AppTextStyle.logoutTitle,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Cancel",
                style: AppTextStyle.logoutButton(AppColors.black),
              ),
              onPressed: () {
                Navigator.pop(ctx);
              },
            ),
            FlatButton(
              color: AppColors.primaryBlue,
              child: Text(
                "Logout",
                style: AppTextStyle.logoutButton(AppColors.white),
              ),
              onPressed: () {
                //TODO:Logout Functioning will come here
                // Navigator.pop(ctx);
                // Navigator.pushReplacementNamed(context,"/HomePage");
                Navigator.pushNamedAndRemoveUntil(context,"/HomePage", (route) => false);
              },
            ),
          ],
        );
      });
}
