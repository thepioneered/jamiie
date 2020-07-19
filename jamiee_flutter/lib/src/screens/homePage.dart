import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/screens/auth/loginPage.dart';
// im'myPoolUser/myPoolUser.dart'art';
import 'package:jamiee_flutter/src/screens/myPoolUser/myPoolUser.dart';
import 'package:jamiee_flutter/src/screens/navbar.dart';
import '../styles/base.dart';
import '../BloC/authBloC.dart';
import '../BloC/authBloCLogin.dart';
import '../providers/passwordVisible.dart';
// import 'auth/loginPage.dart;
// i'auth/'auth/signupPage.dart'rt';
import '../styles/colors.dart';
import '../styles/text.dart';
import 'package:provider/provider.dart';

import 'auth/signupPage.dart';

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
        // body: AppNavigationBar(),
        // body: DashboardPagePlatform(),
        body: MyPool(),
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
        _signupColor = AppColors.placeHolderInput;
        break;
      case PageType.SignupPage:
        _signupColor = AppColors.primaryBlue;
        _loginColor = AppColors.placeHolderInput;
        break;
      default:
        _loginColor = AppColors.primaryBlue;
        _signupColor = AppColors.placeHolderInput;
    }
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthBloc(),
        ),
        ChangeNotifierProvider(
          create: (context) => PasswordStatus(),
        ),
      ],
      child: SingleChildScrollView(
        child: Container(
          padding: BaseStyles.pagePadingLogin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo2.jpg"))),
              ),
              SizedBox(
                height: 40.0,
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
                      child: tabBody(_loginColor, "Login")),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _child = SignupPage();
                          _pageType = PageType.SignupPage;
                        });
                      },
                      child: tabBody(_signupColor, "Sign Up")),
                ],
              ),
              Container(padding: EdgeInsets.only(top: 30.0), child: _child),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBody(Color _color, String text) {
    return Container(
        height: 50.0,
        width: (MediaQuery.of(context).size.width - 60.0) / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              text,
              style: AppTextStyle.tabText(_color),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              color: _color,
              height: 5.0,
            )
          ],
        ));
  }
}

enum PageType { LoginPage, SignupPage }
