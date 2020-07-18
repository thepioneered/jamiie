import 'package:flutter/material.dart';

class AppCheck {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> check(
      BuildContext context, String text) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }
}
