import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/styles/colors.dart';
import 'package:jamiee_flutter/widgets/button.dart';
import 'package:jamiee_flutter/widgets/textField.dart';

class LoginPagePlatform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: LoginPage(),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: LoginPage(),
      );
    }
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextFieldWidget(
          title: "Username",
        ),
        TextFieldWidget(
          title: "Password",
          isPassword: true,
        ),
        AppLoginButton(title: "Next", color: AppColors.primaryBlue)
      ],
    );
  }
}
