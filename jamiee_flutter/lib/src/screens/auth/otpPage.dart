import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../providers/auth/otpProvider.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';

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
        appBar: AppBarWidget.getAppBar(context,""),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                  'Enter 5 digits verification code sent to your number',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500))),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                otpNumberWidget(0),
                                otpNumberWidget(1),
                                otpNumberWidget(2),
                                otpNumberWidget(3),
                                otpNumberWidget(4),
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
                      child: otpProvider.onceClicked
                          ? otpProvider.sendOtpButton(
                              onTap: () {}, loader: true)
                          : otpProvider.sendOtpButton(
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
                    )
                  ],
                ),
              )
            ],
          ),
          //     } else {
          //       return Center(
          //         child: Text("Internet Found Error"),
          //       );
          //     }
          //   } else if (snapshot.hasError) {
          //     return Center(
          //       child: Text("Snapshot Has error else error"),
          //     );
          //   } else {
          //     return Center(
          //       child: Text("Something Exceptional Occured"),
          //     );
          //   }
          // }
          // ),
          // ),
        ));
  }
}
