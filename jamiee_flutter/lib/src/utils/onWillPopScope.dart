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
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "No",
              style: TextStyle(color: AppColors.primaryColorLight),
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
