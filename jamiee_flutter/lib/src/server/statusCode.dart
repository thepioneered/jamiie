import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../utils/snackBar.dart';

class StatusCodeCheck {
  static void checkStatusCode(
      int statusCode, GlobalKey<ScaffoldState> key, Map<String, dynamic> body) {
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
    } else if (statusCode == 405) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: "You have already joined the pool.",
        ),
      );
    } else if (statusCode == 406) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: "Email already exsist.",
        ),
      );
    } else if (statusCode == 500) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: "Internal Server Error.Try Later",
        ),
      );
    } else if (statusCode == 401) {
      if (body != null) {
        try {
          print(body["error"]);
        } catch (e) {
          throw Exception(e);
        }
      }
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: "Wrong Credentials.",
        ),
      );
    } else {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red, title: "Please contact Admin."),
      );
    }
  }
}
