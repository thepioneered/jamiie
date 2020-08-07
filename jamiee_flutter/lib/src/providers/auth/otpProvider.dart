import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../providers/auth/mobileProvider.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../styles/colors.dart';

class OtpProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> otpScaffoldKey = GlobalKey<ScaffoldState>();
  bool onceClicked;

  OtpProvider() {
    onceClicked = false;
  }
  Widget sendOtpButton({@required Function onTap, @required bool loader}) {
    return loader
        ? Center(child: CupertinoActivityIndicator())
        : RaisedButton(
            onPressed: onTap,
            color: AppColors.primaryColorPurple,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Container(
              width: 100.0,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: AppColors.primaryColorLight,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void checkOtp(BuildContext ctx, String otp) async {
    onceClicked = true;
    notifyListeners();
    if (otp.length < 5) {
      otpScaffoldKey.currentState.showSnackBar(snackBar(
          backgroundColor: AppColors.red,
          textColor: AppColors.white,
          title: "Please enter OTP"));
    } else if (otp.length == 5) {
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: otpScaffoldKey,
          endPoint: EndPoints.verifyOtp,
          afterRequest: () {},
          body: {"phone": MobileProvider.mobile.trim(), "otp": otp.toString()});
      onceClicked = false;

      notifyListeners();
      if (body["status"] == true) {
        Navigator.pushNamedAndRemoveUntil(ctx, "/SignupPage", (route) => true);
      }
    } else {
      otpScaffoldKey.currentState.showSnackBar(snackBar(
          backgroundColor: AppColors.red,
          textColor: AppColors.white,
          title: "Error occured at OTP page"));
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
