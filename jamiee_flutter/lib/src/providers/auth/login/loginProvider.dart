import 'package:Jamiie/src/models/pageModel.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
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
  final loginFormKey = GlobalKey<FormState>();
  final loginScaffoldKey = GlobalKey<ScaffoldState>();
  Login login;
  PageModel pageModel;
  bool showPassword;

  //Class Constructor
  LoginProvider() {
    pageModel = PageModel();
    showPassword = false;
    login = Login();
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
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (loginFormKey.currentState.validate()) {
      // pageModel.onceClicked = true;
      // notifyListeners();
      try {
        LoaderDialog.loaderDialog(loginScaffoldKey.currentContext);
      } catch (e) {
        print("Error At Login Provider in Loader Dialog!");
        throw Exception(e);
      }
      loginFormKey.currentState.save();
      print(login.toJson());
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: loginScaffoldKey,
          endPoint: EndPoints.userLogin,
          afterRequest: () {},
          body: login.toJson());
      Navigator.pop(loginScaffoldKey.currentContext);
      if (body["status"]) {
        print(body["body"]);
        await LocalStorage.setTokenMobileFirstLogin(
            body["body"]["token"], login.mobile, body["body"]["firstlogin"]);
        pageModel.onceClicked = false;
        pageModel.onceFormSubmitted = false;
        notifyListeners();
        print(body["body"]["token"]);
        loginFormKey.currentState.reset();
        loginScaffoldKey.currentState.showSnackBar(
          AppSnackBar.snackBar(
              title: "Login Successful", backgroundColor: AppColors.green),
        );
        if (body["body"]["firstlogin"]) {
          Future.delayed(Duration(milliseconds: 1300), () {
            Navigator.pushReplacementNamed(
                loginScaffoldKey.currentContext, "/NavBar");
          });
        } else {
          Future.delayed(Duration(milliseconds: 1300), () {
            Navigator.pushReplacementNamed(
                loginScaffoldKey.currentContext, "/AfterLoginFormPage");
          });
        }
      } else {
        pageModel.onceClicked = false;
        notifyListeners();
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
