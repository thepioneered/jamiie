import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/models/login.dart';

// import 'package:lottie/lottie.dart';

class AppDialog {
  static showDialogApp(BuildContext context) {
    // print(Login().email);
    // flutter defined function
// Timer(, callback)
    Future.delayed(Duration(milliseconds: 3000), () {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            // title: Text("Alert Dialog title"),
            content: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.25,
                bottom: MediaQuery.of(context).size.height * 0.25,
              ),
              // child: Lottie.asset("assets/loading.json"),
              // ),
            ),
          );
        },
      );
    }).then((vale) {
      print("Done");

      Navigator.pop(context);
    });
  }
}
