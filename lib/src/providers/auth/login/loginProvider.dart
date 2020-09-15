import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/auth/loginResponse.dart';
import '../../../models/base/pageModel.dart';
import '../../../widgets/loaderDialog.dart';
import '../../../widgets/button/appButton.dart';
import '../../../utils/snackBar.dart';
import '../../../models/auth/login.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../styles/colors.dart';
import '../../../utils/sharedPref.dart';

class LoginProviderScaffold {
  final loginScaffoldKey = GlobalKey<ScaffoldState>();
}

class LoginProvider extends ChangeNotifier {
  //Variables and Keys
  final loginFormKey = GlobalKey<FormState>();
  final loginScaffoldKey = GlobalKey<ScaffoldState>();
  Login login;
  PageModel pageModel;
  bool showPassword;
  final _firebaseMessanging = FirebaseMessaging();

  //Class Constructor
  LoginProvider() {
    pageModel = PageModel();
    showPassword = false;
    login = Login();
  }
  Widget loginButton({@required Function onTap}) {
    return AppButton.loginButton(
      onTap: onTap,
      title: "Login",
    );
  }

  Future<String> token(FirebaseMessaging _firebaseMessanging) async {
    return await _firebaseMessanging.getToken();
  }

  //Form Validation Function
  void validateLoginForm() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (loginFormKey.currentState.validate()) {
      try {
        LoaderDialog.loaderDialog(loginScaffoldKey.currentContext);
      } catch (e) {
        print("Error At Login Provider in Loader Dialog!");
        throw Exception(e);
      }
      loginFormKey.currentState.save();
      String mobileToken = await token(_firebaseMessanging);
      login.mobileToken = mobileToken;
      print(login.toJson());

      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
        shouldPagePop: true,
        key: loginScaffoldKey,
        endPoint: EndPoints.userLogin,
        afterRequest: () {}, 
        body: login.toJson(),
      );

      if (body["status"]) {
        final loginResponse = LoginResponse.fromJson(body["body"]);

        await LocalStorage.setTokenMobileFirstLogin(
          loginResponse.token,
          login.mobile,
          loginResponse.profileCompleted,
          loginResponse.riskCalculated,
        );
        pageModel.onceFormSubmitted = false;
        notifyListeners();
        loginFormKey.currentState.reset();
        Navigator.pop(loginScaffoldKey.currentContext);
        loginScaffoldKey.currentState.showSnackBar(
          AppSnackBar.snackBar(
              title: "Login Successful", backgroundColor: AppColors.green),
        );
        if (loginResponse.profileCompleted == true &&
            loginResponse.riskCalculated == true) {
          Future.delayed(Duration(milliseconds: 1300), () {
            Navigator.pushReplacementNamed(
                loginScaffoldKey.currentContext, "/NavBar");
          });
        } else if (!loginResponse.profileCompleted) {
          Future.delayed(Duration(milliseconds: 1300), () {
            Navigator.pushReplacementNamed(
                loginScaffoldKey.currentContext, "/CompleteProfilePage");
          });
        } else if (loginResponse.profileCompleted &&
            !loginResponse.riskCalculated) {
          Future.delayed(Duration(milliseconds: 1300), () {
            Navigator.pushReplacementNamed(
                loginScaffoldKey.currentContext, "/AfterLoginFormPage");
          });
        } else {
          Future.delayed(Duration(milliseconds: 1300), () {
            Navigator.pushReplacementNamed(
                loginScaffoldKey.currentContext, "/AfterLoginFormPage");
          });
        }
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
