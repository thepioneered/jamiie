import 'package:Jamiie/src/styles/text.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';

Future<bool> appConfirmRemoveScreenDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        actionsPadding: EdgeInsets.only(right: 5.0),
        title: Text(
          "Are you sure you want to cancel Registration?",
          style: AppTextStyle.dialogTitle,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "No",
              style: AppTextStyle.dialogButton(AppColors.black),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              return false;
            },
          ),
          FlatButton(
            color: AppColors.primaryColorPurple,
            child: Text(
              "Yes",
              style: AppTextStyle.dialogButton(AppColors.white),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/LoginPage", (route) => false);
              return false;
            },
          ),
        ],
      );
    },
  );
  return false;
}
