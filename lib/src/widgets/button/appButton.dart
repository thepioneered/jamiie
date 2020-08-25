import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../styles/colors.dart';
import '../../styles/text.dart';

class AppButton {
  static Widget loginButton({bool loader, Function onTap, String title}) {
    return loader
        ? SizedBox(
            height: 50.0, child: Center(child: CupertinoActivityIndicator()))
        : RaisedButton(
            onPressed: onTap,
            color: AppColors.primaryColorPurple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                title,
                style: AppTextStyle.loginButtonText(AppColors.white),
              ),
            ),
          );
  }
}
