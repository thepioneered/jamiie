import '../../../providers/auth/forgotPassword/FPotpProvider.dart';
import '../../../widgets/pageHeading.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../styles/colors.dart';
import '../../../widgets/appBar.dart';

class ForgotPasswordOtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordOtpProvider(),
      child: ForgotPasswordOtpWidget(),
    );
  }
}

class ForgotPasswordOtpWidget extends StatefulWidget {
  const ForgotPasswordOtpWidget({Key key}) : super(key: key);
  @override
  _ForgotPasswordOtpWidgetState createState() =>
      _ForgotPasswordOtpWidgetState();
}

class _ForgotPasswordOtpWidgetState extends State<ForgotPasswordOtpWidget> {
  String text = '';
  bool complete = false;

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
      if (text.length == 5) {
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
    var otpProvider = Provider.of<ForgotPasswordOtpProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      key: otpProvider.otpScaffoldKey,
      appBar: AppBarWidget.getAppBar(context, "", isRegistration: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        height: MediaQuery.of(context).size.height - 75.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            PageHeading.topHeading(
                title: "Enter your OTP",
                subTitle: "Please enter otp sent to your mobile number."),
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
              child: otpProvider.pageModel.onceClicked
                  ? otpProvider.verifyOTP(onTap: () {}, loader: true)
                  : otpProvider.verifyOTP(
                      onTap: () {
                        otpProvider.otpModel.otp = text;
                        otpProvider.checkOtp();
                      },
                      loader: false),
            ),
            NumericKeyboard(
              onKeyboardTap: complete ? (String e) {} : _onKeyboardTap,
              textColor: AppColors.black,
              rightIcon: Icon(
                Icons.backspace,
                color: AppColors.black,
              ),
              rightButtonFn: () {
                if (text != "") {
                  try {
                    if (text.length == 5) {
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
  // String text = '';
  // bool complete = false;

  // void _onKeyboardTap(String value) {
  //   print(value + "In function keyboard type");
  //   setState(() {
  //     text = text + value;
  //     if (text.length == 6) {
  //       complete = true;
  //     }
  //   });
  // }

  // Widget otpNumberWidget(int position) {
  //   try {
  //     return Container(
  //       height: 40,
  //       width: 40,
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.black, width: 0),
  //         // borderRadius: const BorderRadius.all(Radius.circular(8))
  //       ),
  //       child: Center(
  //         child: Text(
  //           text[position],
  //           style: TextStyle(color: Colors.black),
  //         ),
  //       ),
  //     );
  //   } catch (e) {
  //     return Container(
  //       height: 40,
  //       width: 40,
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.black, width: 0),
  //         // borderRadius: const BorderRadius.all(Radius.circular(8))
  //       ),
  //     );
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   print("Build Again");
  //   var otpProvider = Provider.of<ForgotPasswordOtpProvider>(context);
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     key: otpProvider.otpScaffoldKey,
  //     appBar: AppBarWidget.getAppBar(context, "", isRegistration: false),
  //     body: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 15.0),
  //       height: MediaQuery.of(context).size.height - 75.0,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         // crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           PageHeading.topHeading(
  //               title: "Enter your OTP",
  //               subTitle: "Please enter otp sent to your mobile number."),
  //           SizedBox(
  //             height: 30.0,
  //           ),
  //           Container(
  //             width: double.infinity,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 otpNumberWidget(0),
  //                 otpNumberWidget(1),
  //                 otpNumberWidget(2),
  //                 otpNumberWidget(3),
  //                 otpNumberWidget(4),
  //               ],
  //             ),
  //           ),
  //           Container(
  //             margin: const EdgeInsets.symmetric(vertical: 10),
  //             child: otpProvider.onceClicked
  //                 ? otpProvider.verifyOTP(onTap: () {}, loader: true)
  //                 : otpProvider.verifyOTP(
  //                     onTap: () {
  //                       otpProvider.checkOtp(context, text);
  //                     },
  //                     loader: false),
  //           ),
  //           NumericKeyboard(
  //             onKeyboardTap: complete
  //                 ? (String d) {
  //                     print(d);
  //                   }
  //                 : _onKeyboardTap,
  //             textColor: AppColors.black,
  //             rightIcon: Icon(
  //               Icons.backspace,
  //               color: AppColors.black,
  //             ),
  //             rightButtonFn: () {
  //               if (text != "") {
  //                 try {
  //                   if (text.length == 6) {
  //                     setState(() {
  //                       text = text.substring(0, text.length - 1);

  //                       complete = false;
  //                     });
  //                   } else {
  //                     setState(() {
  //                       text = text.substring(0, text.length - 1);
  //                     });
  //                   }
  //                 } catch (e) {
  //                   print(e);
  //                 }
  //               }
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
