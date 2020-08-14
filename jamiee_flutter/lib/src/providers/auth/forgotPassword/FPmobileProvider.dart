import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/server/endpoint.dart';
import 'package:jamiee_flutter/src/server/networkCalls.dart';
import 'package:jamiee_flutter/src/widgets/button/appButton.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> forgotPasswordScaffoldKey =
      GlobalKey<ScaffoldState>();

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  Widget child;
  String mobile;
  static String mobilee;
  bool onceClicked;
  bool onceFormsubmitted;

  ForgotPasswordProvider() {
    onceClicked = false;
    onceFormsubmitted = false;
  }

  Widget sendOtpButton({@required Function onTap, @required bool loader}) {
    return AppButton.loginButton(
      loader: loader,
      onTap: onTap,
      title: "Send OTP",
    );
  }

  void forgotPassword() async {
    onceFormsubmitted = true;
    notifyListeners();
    if (forgotPasswordFormKey.currentState.validate()) {
      forgotPasswordFormKey.currentState.save();
      onceClicked = true;
      notifyListeners();
      mobilee = '+91$mobile';

      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
        key: forgotPasswordScaffoldKey,
        endPoint: EndPoints.forgotPassword,
        afterRequest: () {},
        //TODO:EDIT MOBILE NUMBER HARDCODE
        body: {"phone": "+91$mobile"},
      );
      if (body["status"]) {
        onceClicked = false;
        onceFormsubmitted = false;
        notifyListeners();
        forgotPasswordFormKey.currentState.reset();
        Navigator.pushReplacementNamed(
            forgotPasswordScaffoldKey.currentContext, "/FPOtpPage");
      } else {
        onceClicked = false;
        onceFormsubmitted = false;
        notifyListeners();
      }
    }
  }
}
