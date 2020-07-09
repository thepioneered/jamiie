import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../BloC/authBloCLogin.dart';
import '../styles/colors.dart';
import '../widgets/button.dart';
import '../widgets/textField.dart';
import '../models/login.dart';
// import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Login _login = Login();
  bool onceClicked = false;
  AuthBloCLogin check = AuthBloCLogin();

  @override
  void dispose() {
    super.dispose();
    check.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        StreamBuilder<String>(
            stream: check.emailLoginStream,
            builder: (context, snapshot) {
              return TextFieldWidget(
                title: "Email",
                keyboardType: TextInputType.emailAddress,
                onChanged: (String e) {
                  if (!onceClicked) {
                    // this._email = e;
                    this._login.email = e;
                  } else {
                    check.emailLoginSink(e);
                    this._login.email = e;
                  }
                },
                errorText: snapshot.error,
              );
            }),
        StreamBuilder<String>(
            stream: check.passwordLoginStream,
            builder: (context, snapshot) {
              return TextFieldWidget(
                title: "Password",
                isPassword: true,
                keyboardType: TextInputType.text,
                onChanged: (String e) {
                  if (!onceClicked) {
                    // this._email = e;
                    this._login.password = e;
                  } else {
                    check.passwordLoginSink(e);
                    this._login.password = e;
                  }
                },
                errorText: snapshot.error,
                passwordFieldType: PasswordFieldType.LoginField,
              );
            }),
        SizedBox(
          height: 20.0,
        ),
        StreamBuilder<bool>(
            stream: check.isValidLogin,
            builder: (context, snapshot) {
              return AppLoginButton(
                title: "Login",
                color: AppColors.primaryBlue,
                onTap: () {
                  if (!onceClicked){
                    this._login.email != null
                        ? check.emailLoginSink(this._login.email)
                        : check.emailLoginSink("null");
                    this._login.password != null
                        ? check.passwordLoginSink(this._login.password)
                        : check.passwordLoginSink("null");
                  }

                  onceClicked = true;
                  print(snapshot.hasError);
                  //TODO: Login Request will be made under this
                  if (!snapshot.hasError) {
                    FocusScope.of(context).unfocus(); //To close keyboar if open
                    print("{${_login.email},${_login.password}}");
                  }
                },
              );
            })
      ],
    );
  }
}
