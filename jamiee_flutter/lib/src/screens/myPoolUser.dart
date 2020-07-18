import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/base.dart';
import '../styles/colors.dart';
import '../widgets/button.dart';

// class MyPoolPlatform extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS) {
//       return CupertinoPageScaffold(
//         child: MyPool(),
//       );
//     } else {
//       return Scaffold(
//         body: MyPool(),
//       );
//     }
//   }
// }

class MyPool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body:
    return Container(
      padding: EdgeInsets.only(top: BaseStyles.topPadding),
      child: Text("Pool"),
      // child: Stack(
      //   children: <Widget>[
      //     Container(
      //         color: AppColors.backgroundColor,
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         child: ListView.builder(itemBuilder: (context, index) {
      //           return Container();
      //         })),
      //     Positioned(
      //       top: 20.0,
      //       left: 20.0,
      //       child: Text("Current Schemes"),
      //     ),
      //     Positioned(
      //         bottom: 20.0,
      //         left: MediaQuery.of(context).size.width * 0.25,
      //         child: AppLoginButton(
      //           title: "Add pool",
      //           onTap: () {},
      //           color: AppColors.primaryBlue,
      //           width: MediaQuery.of(context).size.width / 2,
      //           shapeBorder:
      //               RoundedRectangleBorder(borderRadius: BaseStyles.radius),
      //         ))
      //   ],
      // ),
      // ),
    );
  }
}
