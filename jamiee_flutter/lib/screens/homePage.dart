import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/screens/loginPage.dart';
import 'package:jamiee_flutter/styles/colors.dart';

class HomePagePlatform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: HomePage(),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: HomePage(),
      );
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 30.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () => print("F"),
                child: Container(
                  width: (MediaQuery.of(context).size.width - 60.0) / 2,
                  child: Text("Sign Up"),
                ),
              ),
              InkWell(
                onTap: () => print("F"),
                child: Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2,
                  child: Text("Login"),
                ),
              ),
            ],
          ),
          Expanded(
            child: LoginPage(),
          )
        ],
      ),
    );
  }
}
