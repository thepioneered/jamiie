import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/auth/forgotPassword/FPmobileProvider.dart';
import 'package:jamiee_flutter/src/widgets/button/appButton.dart';

import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../styles/colors.dart';

class ForgotPasswordOtpProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> otpScaffoldKey = GlobalKey<ScaffoldState>();
  bool onceClicked;

  ForgotPasswordOtpProvider() {
    onceClicked = false;
  }
  Widget verifyOTP({@required Function onTap, @required bool loader}) {
    return AppButton.loginButton(
        loader: loader, onTap: onTap, title: "Verify Otp");
  }

  void checkOtp(BuildContext ctx, String otp) async {
    if (otp.length < 5) {
      otpScaffoldKey.currentState.showSnackBar(snackBar(
          backgroundColor: AppColors.red,
          textColor: AppColors.white,
          title: "Please enter OTP"));
    } else if (otp.length == 5) {
      onceClicked = true;
      notifyListeners();
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: otpScaffoldKey,
          endPoint: EndPoints.verifyOtp,
          afterRequest: () {},
          body: {
            "phone": ForgotPasswordProvider.mobilee.trim(),
            "otp": otp.toString()
          });
      print(body["status"]);

      if (body["status"] == true) {
        Navigator.pushReplacementNamed(ctx, "/FPNewPassword");
        onceClicked = false;
        notifyListeners();
      } else {
        onceClicked = false;
        notifyListeners();
      }
    }
  }

  SnackBar snackBar(
      {@required String title,
      @required Color backgroundColor,
      @required Color textColor}) {
    return SnackBar(
      duration: Duration(milliseconds: 1200),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      content: Text(title, style: TextStyle(color: textColor)),
    );
  }
}
