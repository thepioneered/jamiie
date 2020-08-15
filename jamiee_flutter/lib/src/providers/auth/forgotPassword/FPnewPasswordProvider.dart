import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import '../../../providers/auth/forgotPassword/FPmobileProvider.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../styles/colors.dart';
import '../../../utils/snackBar.dart';
import '../../../widgets/button/appButton.dart';

class NewPasswordProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> newpassScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> newpassFormKey = GlobalKey<FormState>();
  final password = TextEditingController();
  String confirmPassword;
  bool onceClicked;
  bool onceFormSubmitted;

  NewPasswordProvider() {
    onceClicked = false;
    onceFormSubmitted = false;
  }

  Widget updatePasswordButton(bool loader, Function onTap) {
    return AppButton.loginButton(
        loader: loader, onTap: onTap, title: "Update Password");
  }

  String hashPassword(String _password) {
    return sha256.convert(utf8.encode(_password)).toString();
  }

  void updateNewPassword() async {
    onceFormSubmitted = true;
    notifyListeners();
    if (newpassFormKey.currentState.validate()) {
      onceClicked = true;
      notifyListeners();
      newpassFormKey.currentState.save();
      print(password.text);
      print(password.text == confirmPassword);
      confirmPassword = hashPassword(confirmPassword);
      print(confirmPassword);
      Map<String, dynamic> body = await NetworkCalls.putDataToServer(
        key: newpassScaffoldKey,
        endPoint:
            '${EndPoints.forgotPassword}/${ForgotPasswordProvider.mobilee.trim().substring(1, ForgotPasswordProvider.mobilee.length)}/',
        body: {
          "password": "$confirmPassword",
        },
      );

      if (body["status"]) {
        onceClicked = false;
        onceFormSubmitted = false;
        notifyListeners();
        password.clear();

        newpassFormKey.currentState.reset();

        Future.delayed(Duration(milliseconds: 1300), () {
          // Navigator.pushReplacementNamed(
          //     newpassScaffoldKey.currentContext, "/LoginPage");
          Navigator.pushNamedAndRemoveUntil(newpassScaffoldKey.currentContext,
              "/LoginPage", (route) => false);
        });
        newpassScaffoldKey.currentState.showSnackBar(
          AppSnackBar.snackBar(
            title: "Password Changed.",
            backgroundColor: AppColors.green,
          ),
        );
      } else {
        onceClicked = false;
        notifyListeners();
        newpassScaffoldKey.currentState.showSnackBar(
          AppSnackBar.snackBar(
            title: "Password Not Changed.",
            backgroundColor: AppColors.red,
          ),
        );
      }
    }
  }

  String confirmPasswordValidation(String data) {
    // print(confirmPassword.text);

    if (data == "null") {
      return "Please Enter Password";
    } else if (data.trim() == null) {
      return "Please Enter Password";
    } else if (data.trim() == "") {
      return "Please Enter Password";
    } else if (data != password.text) {
      return "Password Does not match";
    } else {
      return null;
    }
  }

  // SnackBar snackBar(
  //     {@required String title,
  //     @required Color backgroundColor,
  //     @required Color textColor}) {
  //   return SnackBar(
  //     duration: Duration(milliseconds: 1200),
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: backgroundColor,
  //     content: Text(title, style: TextStyle(color: textColor)),
  //   );
  // }
}
