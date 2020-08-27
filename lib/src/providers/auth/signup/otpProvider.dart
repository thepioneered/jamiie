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

  OtpProvider() {
    otpModel = OtpModel();
  }
  Widget verifyOTP({@required Function onTap}) {
    return AppButton.loginButton(
        onTap: onTap, title: SignUpFlowText.otpPageButton);
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
          key: otpScaffoldKey,
          endPoint: EndPoints.verifyOtp,
          afterRequest: () {},
          body: otpModel.toJson(await LocalStorage.getMobile()));

      if (body["status"]) {
        Navigator.pop(otpScaffoldKey.currentContext);
        Navigator.pushReplacementNamed(
            otpScaffoldKey.currentContext, "/SignupPage");
      }
    }
  }
}
