import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../providers/auth/signup/otpProvider.dart';
import '../../../styles/colors.dart';
import '../../../widgets/appBar.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key key}) : super(key: key);
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String text = '';
  bool complete = false;

  void _onKeyboardTap(String value) {
    print(value + "In function keyboard type");
    setState(() {
      text = text + value;
      if (text.length == 6) {
        complete = true;
      }
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0),
        ),
        child: Center(
          child: Text(
            text[position],
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Build Again");
    var otpProvider = Provider.of<OtpProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      key: otpProvider.otpScaffoldKey,
      appBar: AppBarWidget.getAppBar(context, "", isRegistration: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        height: MediaQuery.of(context).size.height - 75.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Enter your OTP",
                      style: AppTextStyle.authHeading,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Please enter otp sent to your mobile number.",
                      style: AppTextStyle.forgotPasswordSubTitle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  otpNumberWidget(0),
                  otpNumberWidget(1),
                  otpNumberWidget(2),
                  otpNumberWidget(3),
                  otpNumberWidget(4),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: otpProvider.onceClicked
                  ? otpProvider.verifyOTP(onTap: () {}, loader: true)
                  : otpProvider.verifyOTP(
                      onTap: () {
                        otpProvider.checkOtp(context, text);
                      },
                      loader: false),
            ),
            NumericKeyboard(
              onKeyboardTap: complete
                  ? (String d) {
                      print(d);
                    }
                  : _onKeyboardTap,
              textColor: AppColors.black,
              // textColor: Colors.grey[500],
              rightIcon: Icon(
                Icons.backspace,
                color: AppColors.black,
              ),
              rightButtonFn: () {
                if (text != "") {
                  try {
                    if (text.length == 6) {
                      setState(() {
                        text = text.substring(0, text.length - 1);

                        complete = false;
                      });
                    } else {
                      setState(() {
                        text = text.substring(0, text.length - 1);
                      });
                    }
                  } catch (e) {
                    print(e);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
