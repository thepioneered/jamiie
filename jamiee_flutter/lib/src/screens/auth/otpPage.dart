import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/auth/otpProvider.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';

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
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
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
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: AppColors.primaryColorLight.withAlpha(20),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColorPurple,
              size: 16,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: FutureBuilder<Object>(
            future: otpProvider.checkFor(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (!snapshot.hasError) {
                if (snapshot.data != "error") {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                          'Enter 6 digits verification code sent to your number',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26,
                                              fontWeight: FontWeight.w500))),
                                  Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 500),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        otpNumberWidget(0),
                                        otpNumberWidget(1),
                                        otpNumberWidget(2),
                                        otpNumberWidget(3),
                                        otpNumberWidget(4),
                                        otpNumberWidget(5),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              constraints: const BoxConstraints(maxWidth: 500),
                              child: RaisedButton(
                                onPressed: () {
                                  print(text);
                                  otpProvider.checkOtp(context, text);
                                },
                                color: AppColors.primaryColorPurple,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                child: Container(
                                  width: 100.0,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Confirm',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
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
                              ),
                            ),
                            NumericKeyboard(
                              onKeyboardTap: complete
                                  ? (String d) {
                                      print(d);
                                    }
                                  : _onKeyboardTap,
                              textColor: AppColors.primaryColorLight,
                              rightIcon: Icon(
                                Icons.backspace,
                                color: AppColors.primaryColorLight,
                              ),
                              rightButtonFn: () {
                                if (text != "") {
                                  try {
                                    if (text.length == 6) {
                                      setState(() {
                                        text =
                                            text.substring(0, text.length - 1);

                                        complete = false;
                                      });
                                    } else {
                                      setState(() {
                                        text =
                                            text.substring(0, text.length - 1);
                                      });
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                }
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Text("Internet Found Error"),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Snapshot Has error else error"),
                );
              } else {
                return Center(
                  child: Text("Something Exceptional Occured"),
                );
              }
            }),
      ),
    );
  }
}
