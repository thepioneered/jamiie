import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

// class LoginProviderScaffold {
//   final loginScaffoldKey = GlobalKey<ScaffoldState>();
// }

class LoginProvider extends ChangeNotifier {
  //Variables and Keys
  final loginFormKey = GlobalKey<FormState>();
  final loginScaffoldKey = GlobalKey<ScaffoldState>();
  Login login;
  SocialLogin socialLogin;
  PageModel pageModel;
  bool showPassword;
  final _firebaseMessanging = FirebaseMessaging();

  //Class Constructor
  LoginProvider() {
    pageModel = PageModel();
    showPassword = false;
    login = Login();
    socialLogin = SocialLogin();
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

  Future<void> googleSignUp() async {
    await Firebase.initializeApp();
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.email);
      LocalStorage.setSocialLoginEmail(user.email);
      LocalStorage.setSocialLoginName(user.displayName);
      requestToCheckLoginBefore(user.email);
    } catch (e) {
      print(e);
    }
  }

  void requestToCheckLoginBefore(email) async {
    try {
      LoaderDialog.loaderDialog(loginScaffoldKey.currentContext);
    } catch (e) {
      print("Error At Login Provider in Loader Dialog!");
      throw Exception(e);
    }
    socialLogin.email = email;
    String mobileToken = await token(_firebaseMessanging);
    socialLogin.mobileToken = mobileToken;
    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
        key: loginScaffoldKey,
        endPoint: EndPoints.socialLogin,
        afterRequest: () {},
        shouldPagePop: false,
        body: socialLogin.toJson());
    print(data);
    if (data["status"]) {
      await LocalStorage.setSocialLogin();
      print(await LocalStorage.getSocialLogin());
      if (!data["body"]["firstLogin"]) {
        Navigator.pushReplacementNamed(
            loginScaffoldKey.currentContext, "/MobilePage");
      } else {
        final socialLoginResponse = SocialLoginResponse.fromJson(data["body"]);
        await LocalStorage.setTokenMobileFirstLogin(
          socialLoginResponse.token,
          socialLoginResponse.mobile,
          socialLoginResponse.profileCompleted,
          socialLoginResponse.riskCalculated,
        );
        Navigator.pop(loginScaffoldKey.currentContext);
        loginScaffoldKey.currentState.showSnackBar(
          AppSnackBar.snackBar(
              title: "Login Successful", backgroundColor: AppColors.green),
        );
        if (socialLoginResponse.profileCompleted == true &&
            socialLoginResponse.riskCalculated == true) {
          Future.delayed(Duration(milliseconds: 1300), () {
            Navigator.pushReplacementNamed(
                loginScaffoldKey.currentContext, "/NavBar");
          });
        } else if (!socialLoginResponse.profileCompleted) {
          Future.delayed(Duration(milliseconds: 1300), () {
            Navigator.pushReplacementNamed(
                loginScaffoldKey.currentContext, "/CompleteProfilePage");
          });
        } else if (socialLoginResponse.profileCompleted &&
            !socialLoginResponse.riskCalculated) {
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
