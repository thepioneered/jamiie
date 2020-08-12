import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import '../../../models/login.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../server/statusCode.dart';
import '../../../styles/colors.dart';
import '../../../utils/sharedPref.dart';
import '../../../utils/validationRegex.dart';

class LoginProvider extends ChangeNotifier {
  //Variables and Keys
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();
  Login login;
  bool onceFormSubmitted;
  bool onceClicked;
  bool showPassword;

  //Class Constructor
  LoginProvider() {
    onceClicked = false;
    onceFormSubmitted = false;
    showPassword = false;
    login = Login();
  }

  void setOnceFormValidated() {
    onceFormSubmitted = true;
    notifyListeners();
  }

  Widget loginButton({bool loader, Function onTap}) {
    return loader
        ? Center(child: CupertinoActivityIndicator())
        : RaisedButton(
            onPressed: onTap,
            color: AppColors.primaryColorPurple,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
              child: Text(
                'Login',
                style: AppTextStyle.loginButtonText(AppColors.white),
              ),
            ),
          );
  }

  //Form Validation Function
  void validateLoginForm() async {
    if (loginFormKey.currentState.validate()) {
      onceClicked = true;
      notifyListeners();
      loginFormKey.currentState.save();
      //Todo
      login.mobile = '+91${login.mobile}';
      print(login.mobile);
      print(login.password);
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: loginScaffoldKey,
          endPoint: EndPoints.userLogin,
          afterRequest: () {},
          body: {
            "phone": login.mobile.toString(),
            "password": login.password,
          });
      if (body["status"] == true) {
        await LocalStorage()
            .setTokenMobile(body["body"]["token"], login.mobile);
        onceFormSubmitted = false;
        onceClicked = false;
        print(body["body"]["token"]);
        loginFormKey.currentState.reset();
        notifyListeners();
      } else {
        onceClicked = false;
        notifyListeners();
      }

      //TODO: Check if required else remove it
      if (body["status"] == true) {
        loginScaffoldKey.currentState.showSnackBar(
          StatusCodeCheck.snackBar(
              title: "Login Successful", backgroundColor: AppColors.green),
        );

        Future.delayed(Duration(milliseconds: 1300), () {
          Navigator.pushReplacementNamed(
              loginScaffoldKey.currentContext, "/NavBar");
        });
      }
    }
  }

  String loginPageMobileValidation(String data) {
    if (data == "null") {
      return "Please Enter Mobile Number";
    } else if (data.trim() == null) {
      return "Please Enter Mobile Number";
    } else if (data.trim() == "") {
      return "Please Enter Mobile Number";
    } else if (!AppRegularExpression.mobileRegExp
        .hasMatch(data.toString().trim())) {
      return "Please enter a valid Mobile Number";
    } else {
      return null;
    }
  }

  String loginPagePasswordValidation(String data) {
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
}

class PasswordStatusLogin extends ChangeNotifier {
  bool showPassword;

  PasswordStatusLogin() {
    showPassword = false;
  }

  void setStatus() {
    this.showPassword = !showPassword;
    notifyListeners();
  }
}
