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
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50.0,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10.0,
              ),
              child: Text(
                title,
                style: AppTextStyle.loginButtonText(AppColors.white),
              ),
            ),
          );
  }
}
