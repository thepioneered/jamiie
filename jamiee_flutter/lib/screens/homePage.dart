import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/screens/loginPage.dart';
import 'package:jamiee_flutter/screens/signupPage.dart';
import 'package:jamiee_flutter/styles/colors.dart';
import 'package:jamiee_flutter/styles/text.dart';

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
  Widget _child;
  PageType _pageType;
  @override
  void initState() {
    _child = LoginPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("++++++++++HOME PAGE BUILD+++++++++++");
    Color _loginColor;
    Color _signupColor;
    switch (_pageType) {
      case PageType.LoginPage:
        _loginColor = AppColors.primaryBlue;
        _signupColor = AppColors.grayLoginTabColor;
        break;
      case PageType.SignupPage:
        _signupColor = AppColors.primaryBlue;
        _loginColor = AppColors.grayLoginTabColor;
        break;
      default:
        _loginColor = AppColors.primaryBlue;
        _signupColor = AppColors.grayLoginTabColor;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 30.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    _child = LoginPage();
                    _pageType = PageType.LoginPage;
                  });
                },
                child: Container(
                    height: 50.0,
                    width: (MediaQuery.of(context).size.width - 60.0) / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: AppTextStyle.tabText(_loginColor),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          color: _loginColor,
                          height: 5.0,
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _child = SignupPage();
                    _pageType = PageType.SignupPage;
                  });
                },
                child: Container(
                    height: 50.0,
                    width: (MediaQuery.of(context).size.width - 60.0) / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Sign Up",
                          style: AppTextStyle.tabText(_signupColor),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          color: _signupColor,
                          height: 5.0,
                        )
                      ],
                    )),
              ),
            ],
          ),
          Expanded(
            child: _child,
          )
        ],
      ),
    );
  }
}

enum PageType { LoginPage, SignupPage }
