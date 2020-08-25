import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderDialog {
  static Future<bool> _willPopCallback() async {
    return Future.value(false);
  }

  static Future<Null> loaderDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () => _willPopCallback(),
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              width: 120.0,
              height: 120.0,
              child: Lottie.asset("assets/loader.json"),
            ),
          ),
        ),
      ),
    );
  }
}
