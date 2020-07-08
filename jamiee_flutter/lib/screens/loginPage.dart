import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/styles/colors.dart';
import 'package:jamiee_flutter/widgets/button.dart';
import 'package:jamiee_flutter/widgets/textField.dart';

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
        SizedBox(
          height: 20.0,
        ),
        AppLoginButton(
          title: "Login",
          color: AppColors.primaryBlue,
          onTap: () {
            print("Login Page");
          },
        )
      ],
    );
  }
}
