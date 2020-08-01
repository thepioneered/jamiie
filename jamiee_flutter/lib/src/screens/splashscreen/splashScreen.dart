import 'package:flutter/material.dart';
import '../../styles/base.dart';
import './chooseSignIn.dart';

// PageView.builder(
//           controller: _pageController,
//           itemBuilder:(ctx,index){
//           return Container();
//         }),
class SplashScreenPage extends StatelessWidget {
  // final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: BaseStyles.topPadding),
      child: ChooseSignInPage(),
    ));
  }
}
