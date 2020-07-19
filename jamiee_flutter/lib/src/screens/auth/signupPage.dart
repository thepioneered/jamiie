import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/models/signup.dart';
import 'package:provider/provider.dart';
import '../../BloC/authBloC.dart';
import '../../styles/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/textField.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int _containerNumber = 0;
  Widget _child;
  StreamBuilder<bool> _appLoginButton;
  // AuthBloc _authBloc = AuthBloc();
  Signup _signup = Signup();

  // @override
  // void disposeApp() {
  //   // TODO: implement dispose
  //   // super.dispose();
  //   _authBloc.dispose();
  //   print("SignUp Disposed");
  // }

  @override
  Widget build(BuildContext context) {
    print("+++++++++Signup Build+++++++++");
    bool onceClicked;
    var _authBloc = Provider.of<AuthBloc>(context);
    switch (_containerNumber) {
      case 0:
        onceClicked = false;
        _child = Column(
          children: <Widget>[
            StreamBuilder<String>(
                stream: _authBloc.nameStream,
                builder: (context, snapshot) {
                  return TextFieldWidget(
                    title: "Name",
                    keyboardType: TextInputType.text,
                    onChanged: (String e) {
                      if (!onceClicked) {
                        // this._email = e;
                        this._signup.name = e;
                      } else {
                        _authBloc.nameSink(e);
                        this._signup.name = e;
                      }
                    },
                    errorText: snapshot.error,
                  );
                }),
            StreamBuilder<String>(
                stream: _authBloc.emailStream,
                builder: (context, snapshot) {
                  return TextFieldWidget(
                    title: "Email",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String e) {
                      if (!onceClicked) {
                        
                        this._signup.email = e;
                      } else {
                        _authBloc.emailSink(e);
                        this._signup.email = e;
                      }
                    },
                    errorText: snapshot.error,
                  );
                }),
            StreamBuilder<String>(
                stream: _authBloc.mobileStream,
                builder: (context, snapshot) {
                  return TextFieldWidget(
                    title: "Mobile No.",
                    keyboardType: TextInputType.number,
                    onChanged: (String e) {
                      if (!onceClicked) {
                        this._signup.mobile = e;
                      } else {
                        _authBloc.mobileSink(e);
                        this._signup.mobile = e;
                      }
                    },
                    errorText: snapshot.error,
                  );
                }),
          ],
        );
        _appLoginButton = StreamBuilder<bool>(
            stream: _authBloc.isSignupValid1,
            builder: (context, snapshot) {
              return AppLoginButton(
                color: AppColors.primaryBlue,
                title: "Next",
                onTap: () {
                  if (!onceClicked) {
                    print("${this._signup.name} is Username");
                    this._signup.name != null
                        ? _authBloc.nameSink(this._signup.name)
                        : _authBloc.nameSink("null");
                    this._signup.email != null
                        ? _authBloc.emailSink(this._signup.email)
                        : _authBloc.emailSink("null");
                    this._signup.mobile != null
                        ? _authBloc.mobileSink(this._signup.mobile)
                        : _authBloc.mobileSink("null");
                  }
                  onceClicked = true;
                  print("${snapshot.error} is error");

                  if (!snapshot.hasError &&
                      this._signup.name != null &&
                      this._signup.email != null &&
                      this._signup.mobile != null) {
                    print(
                        "${this._signup.name},${this._signup.email},${this._signup.mobile}");
                    setState(() {
                      _containerNumber++;
                    });
                  }
                },
              );
            });
        break;
      case 1:
        onceClicked = false;
        _child = Column(
          children: <Widget>[
            StreamBuilder<String>(
                stream: _authBloc.passwordStream,
                builder: (context, snapshot) {
                  return TextFieldWidget(
                    title: "Password",
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    passwordFieldType: PasswordFieldType.SignupField,
                    onChanged: (String e) {
                      if (!onceClicked) {
                        this._signup.password = e;
                      } else {
                        _authBloc.passwordSink(e);
                        this._signup.password = e;
                      }
                    },
                    errorText: snapshot.error,
                  );
                }),
            StreamBuilder<String>(
                stream: _authBloc.confirmpasswordStream,
                builder: (context, snapshot) {
                  return TextFieldWidget(
                    title: "Confirm Password",
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    errorText: snapshot.error,
                    onChanged: (String e) {
                      if (!onceClicked) {
                        this._signup.confirmPassword = e;
                      } else {
                        _authBloc.confirmPasswordSink(e);
                        this._signup.confirmPassword = e;
                      }
                    },
                    passwordFieldType: PasswordFieldType.SignupConfirmField,
                  );
                }),
            AppLoginButton(
              color: AppColors.primaryOrange,
              title: "Back",
              onTap: () {
                setState(() {
                  _containerNumber--;
                });
              },
            ),
          ],
        );
        _appLoginButton = StreamBuilder<bool>(
            stream: _authBloc.isPasswordValid,
            builder: (context, snapshot) {
              return AppLoginButton(
                color: AppColors.primaryBlue,
                title: "Next",
                onTap: () {
                  if (!onceClicked) {
                    print("${this._signup.password} is Password");
                    this._signup.password != null
                        ? _authBloc.passwordSink(this._signup.password)
                        : _authBloc.passwordSink("null");
                    this._signup.confirmPassword != null
                        ? _authBloc
                            .confirmPasswordSink(this._signup.confirmPassword)
                        : _authBloc.confirmPasswordSink("null");
                  }
                  onceClicked = true;
                  print("${snapshot.error} is error");

                  if (!snapshot.hasError &&
                      this._signup.password != null &&
                      this._signup.confirmPassword != null) {
                    print(
                        "${this._signup.password},${this._signup.confirmPassword}");
                    setState(() {
                      _containerNumber++;
                    });
                  }
                },
              );
            });
        break;
      case 2:
        _child = Column(
          children: <Widget>[
            TextFieldWidget(
              title: "Select City",
              keyboardType: TextInputType.text,
            ),
            TextFieldWidget(
              title: "Select State",
              keyboardType: TextInputType.text,
            ),
            AppLoginButton(
              color: AppColors.primaryOrange,
              title: "Back",
              onTap: () {
                setState(() {
                  _containerNumber--;
                });
              },
            ),
          ],
        );

        _appLoginButton = StreamBuilder<bool>(
            stream: null,
            builder: (context, snapshot) {
              return AppLoginButton(
                color: AppColors.primaryBlue,
                title: "Proceed",
                onTap: () {
                  print("Submit Pressed");
                },
              );
            });
        break;
      default:
        _containerNumber = 0;
        _child = Column(
          children: <Widget>[
            TextFieldWidget(
              title: "Name",
              keyboardType: TextInputType.text,
            ),
            TextFieldWidget(
              title: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            TextFieldWidget(
                title: "Mobile No.", keyboardType: TextInputType.number),
          ],
        );
        AppLoginButton(
          color: AppColors.primaryOrange,
          title: "Back",
          onTap: () {
            setState(() {
              _containerNumber--;
            });
          },
        );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.41,
            child: SingleChildScrollView(child: _child)),
        SizedBox(
          height: 20.0,
        ),
        _appLoginButton
      ],
    );
  }
}
