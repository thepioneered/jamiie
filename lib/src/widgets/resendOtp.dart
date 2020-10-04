import 'package:Jamiie/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../styles/text.dart';

class ResendOtp extends StatefulWidget {
  final Function resendOtp;
  ResendOtp({@required this.resendOtp});
  @override
  _ResendOtpState createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  bool isEnabled = true;
  Timer _timer;
  int _start = 15;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            isEnabled = true;
          } else {
            _start = _start - 1;
            isEnabled = false;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_start != null)
            Text(
              "$_start" + " seconds",
              style: AppTextStyle.dontHaveAccount,
            ),
          FlatButton(
            disabledTextColor: AppColors.grayInputHeading,
            textColor: AppColors.primaryColorPurple,
            child: Text(
              " Resend Otp",
              style: AppTextStyle.resendOtp,
            ),
            onPressed: isEnabled
                ? () {
                    _start = 15;
                    startTimer();
                    widget.resendOtp();
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
