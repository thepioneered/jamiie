import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/login.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../server/statusCode.dart';
import '../../styles/colors.dart';
import '../../utils/sharedPref.dart';
import '../../utils/validationRegex.dart';

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

  //Form Validation Function
  void validateLoginForm() async {
    if (loginFormKey.currentState.validate()) {
      onceClicked = true;
      notifyListeners();
      loginFormKey.currentState.save();
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
        await LocalStorage().setToken(body["body"]["token"]);
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
          print("DONE");
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
