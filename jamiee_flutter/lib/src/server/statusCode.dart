import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';

class StatusCodeCheck {
  static void checkStatusCode(int statusCode, GlobalKey<ScaffoldState> key) {
    if (statusCode == 404) {
      key.currentState.showSnackBar(
        snackBar(backgroundColor: AppColors.red, title: "Wrong network call."),
      );
    } else if (statusCode == 409) {
      key.currentState.showSnackBar(
        snackBar(backgroundColor: AppColors.red, title: "User already exsist."),
      );
    } else if (statusCode == 500) {
      key.currentState.showSnackBar(
        snackBar(
            backgroundColor: AppColors.red,
            title: "Internal Server Error.Try Later"),
      );
    } else if (statusCode == 401) {
      key.currentState.showSnackBar(
        snackBar(backgroundColor: AppColors.red, title: "Wrong Credentials"),
      );
    } else {
      key.currentState.showSnackBar(
        snackBar(backgroundColor: AppColors.red, title: "Please contact Admin"),
      );
    }
  }

  static SnackBar snackBar({
    @required String title,
    @required Color backgroundColor,
  }) {
    return SnackBar(
      duration: Duration(milliseconds: 1200),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      content: Text(
        title,
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
