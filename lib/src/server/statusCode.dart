import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../utils/snackBar.dart';

class StatusCodeCheck {
  static void checkStatusCode(
    int statusCode,
    GlobalKey<ScaffoldState> key,
    String error,
  ) async {
    print(error);
    if (statusCode == 401) {
      await Future.delayed(
        Duration(milliseconds: 1300),
        () {
          key.currentState.showSnackBar(
            AppSnackBar.snackBar(
              backgroundColor: AppColors.red,
              title: "Token Expired",
            ),
          );
        },
      );

      await LocalStorage.deleteData();
      Navigator.pushNamedAndRemoveUntil(
        key.currentContext,
        "/LoginPage",
        (route) => false,
      );
    } else if (statusCode == 400) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: error,
        ),
      );
    } else if (statusCode == 403) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: error,
        ),
      );
    } else if (statusCode == 404) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: error,
        ),
      );
    } else if (statusCode == 405) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: error,
        ),
      );
    } else if (statusCode == 406) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: error,
        ),
      );
    } else if (statusCode == 409) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: error,
        ),
      );
    } else if (statusCode == 500) {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: "Internal Server Error.Try Later",
        ),
      );
    } else {
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          backgroundColor: AppColors.red,
          title: "Please contact Admin.",
        ),
      );
    }
  }
}
