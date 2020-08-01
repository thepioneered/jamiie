import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:http/http.dart' as http;

class OtpProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> otpScaffoldKey = GlobalKey<ScaffoldState>();

  Future<Object> checkFor() async {
    try {
      print("Getting Data");
      await http.get(
        "https://jsonplaceholder.typicode.com/posts",
        headers: {
          "Content-Type": "application/json",
        },
      );
      return "Done";
    } catch (e) {
      print(e);
      return Future.error(100);

      // return Exception(e);
      // return "error";
    }

    // return true;
  }

  void checkOtp(BuildContext ctx, String otp) {
    if (otp.length < 6) {
      otpScaffoldKey.currentState.showSnackBar(snackBar(
          backgroundColor: AppColors.red,
          textColor: AppColors.white,
          title: "Please enter OTP"));
    } else if (otp.length == 6) {
      otpScaffoldKey.currentState.showSnackBar(
        snackBar(
            backgroundColor: AppColors.green,
            textColor: AppColors.white,
            title: "Your OTP is: $otp"),
      );
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
