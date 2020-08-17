import 'package:Jamiie/src/models/otpModel.dart';
import 'package:Jamiie/src/models/pageModel.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
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
  PageModel pageModel;

  OtpProvider() {
    pageModel = PageModel();
    otpModel = OtpModel();
  }
  Widget verifyOTP({@required Function onTap, @required bool loader}) {
    return AppButton.loginButton(
        loader: loader, onTap: onTap, title: "Verify Authorization Code");
  }

  void checkOtp() async {
    if (otpModel.otp.length < 5) {
      otpScaffoldKey.currentState.showSnackBar(
        AppSnackBar.snackBar(
            backgroundColor: AppColors.red, title: "Please enter OTP"),
      );
    } else if (otpModel.otp.length == 5) {
      // pageModel.onceClicked = true;
      // notifyListeners();
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
      Navigator.pop(otpScaffoldKey.currentContext);

      if (body["status"]) {
        pageModel.onceClicked = false;
        notifyListeners();
        Navigator.pushReplacementNamed(
            otpScaffoldKey.currentContext, "/SignupPage");
      } else {
        pageModel.onceClicked = false;
        notifyListeners();
      }
    }
  }
}
