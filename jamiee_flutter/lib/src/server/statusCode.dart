import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:jamiee_flutter/src/utils/snackBar.dart';

class StatusCodeCheck {
  static void checkStatusCode(int statusCode, GlobalKey<ScaffoldState> key) {
    if (statusCode == 404) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red, title: "Wrong network call."),
      );
    } else if (statusCode == 409) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red, title: "User already exsist."),
      );
    } else if (statusCode == 403) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red, title: "User does not exsist."),
      );
    } else if (statusCode == 406) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red, title: "Email already exsist."),
      );
    } else if (statusCode == 500) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red,
            title: "Internal Server Error.Try Later"),
      );
    } else if (statusCode == 401) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red, title: "Wrong Credentials."),
      );
    } else {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red, title: "Please contact Admin."),
      );
    }
  }
}
