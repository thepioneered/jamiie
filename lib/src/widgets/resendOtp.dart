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
  int _start = 0;

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
          // Text(
          //   "Didn't receive otp?",
          //   style: AppTextStyle.dontHaveAccount,
          // ),
            FlatButton(
            child: Text(
              " Resend Otp",
              style: AppTextStyle.createOne,
            ),
            onPressed: isEnabled
                ? () {
                    _start = 15;
                    startTimer();
                    widget.resendOtp();
                  }
                : null,
          ),
          if (_start != 0) Text("$_start"),
        ],
      ),
    );
  }
}
