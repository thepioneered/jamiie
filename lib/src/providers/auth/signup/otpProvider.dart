import 'package:Jamiie/src/models/auth/login.dart';
import 'package:Jamiie/src/models/auth/loginResponse.dart';
import 'package:Jamiie/src/providers/auth/login/socialLoginProvider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../models/auth/otpModel.dart';
import '../../../repositry/textConst.dart';
import '../../../utils/sharedPref.dart';
import '../../../widgets/loaderDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/snackBar.dart';
import '../../../widgets/button/appButton.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../styles/colors.dart';

class OtpProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> otpScaffoldKey = GlobalKey<ScaffoldState>();
  OtpModel otpModel;
  final _firebaseMessanging = FirebaseMessaging();
  SocialLogin socialLogin;
  OtpProvider() {
    otpModel = OtpModel();
  }
  Widget verifyOTP({@required Function onTap}) {
    return AppButton.loginButton(
        onTap: onTap, title: SignUpFlowText.otpPageButton);
  }

  Future<String> token(FirebaseMessaging _firebaseMessanging) async {
    return await _firebaseMessanging.getToken();
  }

  void checkOtp() async {
    if (otpModel.otp.length < 5) {
      otpScaffoldKey.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red, title: "Please enter OTP"),
      );
    } else if (otpModel.otp.length == 5) {
      try {
        LoaderDialog.loaderDialog(otpScaffoldKey.currentContext);
      } catch (e) {
        print("Error At Logout Provider in Loader Dialog!");
        throw Exception(e);
      }
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          shouldPagePop: true,
          key: otpScaffoldKey,
          endPoint: EndPoints.verifyOtp,
          afterRequest: () {},
          body: otpModel.toJson(await LocalStorage.getMobile()));

      if (body["status"]) {
        if (await LocalStorage.getSocialLogin() == true) {
          socialLogin = SocialLogin();
          print(SocialSignup().toJson(
              await LocalStorage.getMobile(),
              await LocalStorage.getSocialLoginEmail(),
              await LocalStorage.getSocialLoginName()));

          // Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          //   shouldPagePop: true,
          //   key: otpScaffoldKey,
          //   endPoint: EndPoints.socialUserRegistration,
          //   afterRequest: () {},
          //   body: SocialSignup().toJson(
          //       await LocalStorage.getMobile(),
          //       await LocalStorage.getSocialLoginEmail(),
          //       await LocalStorage.getSocialLoginName()),
          // );
          socialLogin.email = await LocalStorage.getSocialLoginEmail();
          String mobileToken = await token(_firebaseMessanging);
          socialLogin.mobileToken = mobileToken;
          Map<String, dynamic> data1 = await NetworkCalls.postDataToServer(
              key: otpScaffoldKey,
              endPoint: EndPoints.socialLogin,
              afterRequest: () {},
              shouldPagePop: false,
              body: socialLogin.toJson());
               final socialLoginResponse = SocialLoginResponse.fromJson(data1["body"]);
        await LocalStorage.setTokenMobileFirstLogin(
          socialLoginResponse.token,
          socialLoginResponse.mobile,
          socialLoginResponse.profileCompleted,
          socialLoginResponse.riskCalculated,
        );
          if (data1["status"]) {
            if (data1["body"]["firstLogin"]) {
              Navigator.pushReplacementNamed(
                  otpScaffoldKey.currentContext, "/CompleteProfilePage");
            }
          }

        } else {
          Navigator.pop(otpScaffoldKey.currentContext);
          Navigator.pushReplacementNamed(
              otpScaffoldKey.currentContext, "/SignupPage");
        }
      }
    }
  }

  void resendOtp() async {
    final String _mobile = await LocalStorage.getMobile();
    try {
      LoaderDialog.loaderDialog(otpScaffoldKey.currentContext);
    } catch (e) {
      print("Error At Logout Provider in Loader Dialog!");
      throw Exception(e);
    }
    Map<String, dynamic> body = await NetworkCalls.postDataToServer(
      shouldPagePop: true,
      key: otpScaffoldKey,
      endPoint: EndPoints.resendOtp,
      afterRequest: () {},
      body: ResendOtpModel().toJson(_mobile),
    );
    if (body["status"]) {
      Navigator.pop(otpScaffoldKey.currentContext);
    }
  }
}
