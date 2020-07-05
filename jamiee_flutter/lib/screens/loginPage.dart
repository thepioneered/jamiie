import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        body: LoginPage(),
      );
    }
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Sign In",
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
          Container(
            child: Column(
              children: <Widget>[
                TextFieldWidget(
                  title: "Username",
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFieldWidget(
                  title: "Password",
                  isPassword: true,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Row(
                children: <Widget>[
                  Checkbox(
                      value: false,
                      onChanged: (bool a) {
                        print(a);
                      }),
                  Text("Remember Me"),
                ],
              )),
              Text("Forgot Password?"),
            ],
          ),
          SizedBox(
            height: 50.0,
            child: ButtonTheme(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.blue,
                onPressed: () {},
                child: Center(child: Text("Sign In")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
