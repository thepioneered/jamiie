import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/screens/auth/singup/mobilePage.dart';
import 'package:jamiee_flutter/src/widgets/button/appButton.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../styles/colors.dart';
import '../../../utils/validationRegex.dart';

class MobileProvider extends ChangeNotifier {
  bool onceClicked;
  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> mobileFormKey = GlobalKey<FormState>();
  static String mobile;
  String formMobile;

  MobileProvider() {
    onceClicked = false;
  }

  void setOnceClicked() {
    onceClicked = false;
    notifyListeners();
  }

  Widget sendOtpButton({@required Function onTap, @required bool loader}) {
    return AppButton.loginButton(
        loader: loader, onTap: onTap, title: "Send OTP",);
  }

  void mobileNumberCheck(BuildContext ctx) async {
    if (mobileFormKey.currentState.validate()) {
      mobileFormKey.currentState.save();
      print(formMobile);
      mobile = '+91$formMobile';
      onceClicked = true;
      notifyListeners();
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: loginScaffoldKey,
          endPoint: EndPoints.sendOtp,
          afterRequest: () {},
          //TODO
          body: {"phone": "${mobile.toString()}"});
      onceClicked = false;
      notifyListeners();
      print(body["status"]);

      if (body["status"] == true) {
        mobileFormKey.currentState.reset();
        Navigator.pushReplacementNamed(ctx, "/OtpPage");
      }
    }
  }

  String mobilePageMobileValidation(String data) {
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
}
