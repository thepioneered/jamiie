import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/button/appButton.dart';
import '../../../utils/snackBar.dart';
import '../../../models/login.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../styles/colors.dart';
import '../../../utils/sharedPref.dart';

class LoginProviderScaffold {
  final loginScaffoldKey = GlobalKey<ScaffoldState>();
}

class LoginProvider extends ChangeNotifier {
  //Variables and Keys
  // GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();
  final loginFormKey = GlobalKey<FormState>();
  final loginScaffoldKey = GlobalKey<ScaffoldState>();
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

  Widget loginButton({@required Function onTap, @required bool loader}) {
    return AppButton.loginButton(
      loader: loader,
      onTap: onTap,
      title: "Login",
    );
  }

  //Form Validation Function
  void validateLoginForm() async {
    if (loginFormKey.currentState.validate()) {
      onceClicked = true;
      notifyListeners();
      loginFormKey.currentState.save();
      // Todo:Change is req
      login.mobile = '+91${login.mobile}';
      print(login.toJson());
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
          AppSnackBar.snackBar(
              title: "Login Successful", backgroundColor: AppColors.green),
        );

        Future.delayed(Duration(milliseconds: 1300), () {
          Navigator.pushReplacementNamed(
              loginScaffoldKey.currentContext, "/NavBar");
        });
      }
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
