import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/models/signup.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:jamiee_flutter/src/utils/validationRegex.dart';

class SignupProvider extends ChangeNotifier {
  //Page Variables and keys
  GlobalKey<ScaffoldState> signupScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  Signup signup;
  bool onceClicked;
  bool onceFormValidated;
  TextEditingController confirmPassword;

  //Class Constructor
  SignupProvider() {
    confirmPassword = TextEditingController();
    signup = Signup();
    onceClicked = false;
    onceFormValidated = false;
  }

  //Page Logic
  Widget signupButtonCreateAccount({bool loader, Function onTap}) {
    return loader
        ? Center(child: CupertinoActivityIndicator())
        : RaisedButton(
            onPressed: onTap,
            color: AppColors.primaryColorPurple,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Container(
              width: 100.0,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: AppColors.primaryColorLight,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void validateForm() {
    if (signupFormKey.currentState.validate()) {
      signupFormKey.currentState.save();
      print("\n");
      print(signup.name);
      print(signup.email);
      print(signup.password);
      print("\n");
      onceFormValidated = false;
      notifyListeners();
      // signupFormKey.currentState.reset();
    }
  }

  void setOnceClicked() {
    onceClicked = true;
    notifyListeners();
  }

  void setOnceFormValidated() {
    onceFormValidated = true;
    notifyListeners();
  }

  String signupPageEmailValidation(String data) {
    if (data == "null") {
      return "Please Enter Email";
    } else if (data.trim() == null) {
      return "Please Enter Email";
    } else if (data.trim() == "") {
      return "Please Enter Email";
    } else if (!AppRegularExpression.emailRegExp
        .hasMatch(data.toString().trim())) {
      return "Please enter a valid Email";
    } else {
      return null;
    }
  }

  String signupPagePasswordValidation(String data) {
    if (data == "null") {
      return "Please Enter Password";
    } else if (data.trim() == null) {
      return "Please Enter Password";
    } else if (data.trim() == "") {
      return "Please Enter Password";
    } else {
      return null;
    }
  }

  String signupPageConfirmPasswordValidation(String data) {
    print(confirmPassword.text);
    print(data);
    if (data == "null") {
      return "Please Enter Password";
    } else if (data.trim() == null) {
      return "Please Enter Password";
    } else if (data.trim() == "") {
      return "Please Enter Password";
    } else if (data != confirmPassword.text) {
      return "Password Does not match";
    } else {
      return null;
    }
  }

  String signupPageNameValidation(String data) {
    if (data == "null") {
      return "Please Enter your Name";
    } else if (data.trim() == null) {
      return "Please Enter your Name";
    } else if (data.trim() == "") {
      return "Please Enter your Name";
    } else if (data.length < 7) {
      return "Please enter full Name";
    } else {
      return null;
    }
  }

  String signupPageStateCityValidation(String data) {
    if (data == "null") {
      return "Please Enter your State";
    } else if (data.trim() == null) {
      return "Please Enter your State";
    } else if (data.trim() == "") {
      return "Please Enter your State";
    } else {
      return null;
    }
  }
}
