import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/helper/stateCityData.dart';
import 'package:jamiee_flutter/src/providers/auth/signupProvider.dart';
import 'package:jamiee_flutter/src/styles/base.dart';
import 'package:jamiee_flutter/src/widgets/appBar.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // int _containerNumber = 0;
  // Widget _child;
  // StreamBuilder<bool> _appLoginButton;
  // AuthBloc _authBloc = AuthBloc();
  // Signup _signup = Signup();

  @override
  Widget build(BuildContext context) {
    print("+++++++++Signup Build+++++++++");
    // bool onceClicked;
    // var _authBloc = Provider.of<AuthBloc>(context);
    // switch (_containerNumber) {
    //   case 0:
    //     onceClicked = false;
    //     _child = Column(
    //       children: <Widget>[],
    //     );
    //     _appLoginButton = StreamBuilder<bool>(
    //         stream: _authBloc.isSignupValid1,
    //         builder: (context, snapshot) {
    //           return AppLoginButton(
    //             color: AppColors.primaryBlue,
    //             title: "Next",
    //             onTap: () {
    //               if (!onceClicked) {
    //                 print("${this._signup.name} is Username");
    //                 this._signup.name != null
    //                     ? _authBloc.nameSink(this._signup.name)
    //                     : _authBloc.nameSink("null");
    //                 this._signup.email != null
    //                     ? _authBloc.emailSink(this._signup.email)
    //                     : _authBloc.emailSink("null");
    //                 this._signup.mobile != null
    //                     ? _authBloc.mobileSink(this._signup.mobile)
    //                     : _authBloc.mobileSink("null");
    //               }
    //               onceClicked = true;
    //               print("${snapshot.error} is error");

    //               if (!snapshot.hasError &&
    //                   this._signup.name != null &&
    //                   this._signup.email != null &&
    //                   this._signup.mobile != null) {
    //                 print(
    //                     "${this._signup.name},${this._signup.email},${this._signup.mobile}");
    //                 setState(() {
    //                   _containerNumber++;
    //                 });
    //               }
    //             },
    //           );
    //         });
    //     break;
    //   case 1:
    //     onceClicked = false;
    //     _child = Column(
    //       children: <Widget>[
    //         StreamBuilder<String>(
    //             stream: _authBloc.passwordStream,
    //             builder: (context, snapshot) {
    //               return TextFieldWidget(
    //                 title: "Password",
    //                 keyboardType: TextInputType.text,
    //                 isPassword: true,
    //                 passwordFieldType: PasswordFieldType.SignupField,
    //                 onChanged: (String e) {
    //                   if (!onceClicked) {
    //                     this._signup.password = e;
    //                   } else {
    //                     _authBloc.passwordSink(e);
    //                     this._signup.password = e;
    //                   }
    //                 },
    //                 errorText: snapshot.error,
    //               );
    //             }),
    //         StreamBuilder<String>(
    //             stream: _authBloc.confirmpasswordStream,
    //             builder: (context, snapshot) {
    //               return TextFieldWidget(
    //                 title: "Confirm Password",
    //                 keyboardType: TextInputType.text,
    //                 isPassword: true,
    //                 errorText: snapshot.error,
    //                 onChanged: (String e) {
    //                   if (!onceClicked) {
    //                     this._signup.confirmPassword = e;
    //                   } else {
    //                     _authBloc.confirmPasswordSink(e);
    //                     this._signup.confirmPassword = e;
    //                   }
    //                 },
    //                 passwordFieldType: PasswordFieldType.SignupConfirmField,
    //               );
    //             }),
    //         AppLoginButton(
    //           color: AppColors.primaryOrange,
    //           title: "Back",
    //           onTap: () {
    //             setState(() {
    //               _containerNumber--;
    //             });
    //           },
    //         ),
    //       ],
    //     );
    //     _appLoginButton = StreamBuilder<bool>(
    //         stream: _authBloc.isPasswordValid,
    //         builder: (context, snapshot) {
    //           return AppLoginButton(
    //             color: AppColors.primaryBlue,
    //             title: "Next",
    //             onTap: () {
    //               if (!onceClicked) {
    //                 print("${this._signup.password} is Password");
    //                 this._signup.password != null
    //                     ? _authBloc.passwordSink(this._signup.password)
    //                     : _authBloc.passwordSink("null");
    //                 this._signup.confirmPassword != null
    //                     ? _authBloc
    //                         .confirmPasswordSink(this._signup.confirmPassword)
    //                     : _authBloc.confirmPasswordSink("null");
    //               }
    //               onceClicked = true;
    //               print("${snapshot.error} is error");

    //               if (!snapshot.hasError &&
    //                   this._signup.password != null &&
    //                   this._signup.confirmPassword != null) {
    //                 print(
    //                     "${this._signup.password},${this._signup.confirmPassword}");
    //                 setState(() {
    //                   _containerNumber++;
    //                 });
    //               }
    //             },
    //           );
    //         });
    //     break;
    //   case 2:
    //     _child = Column(
    //       children: <Widget>[
    //         TextFieldWidget(
    //           title: "Select City",
    //           keyboardType: TextInputType.text,
    //         ),
    //         TextFieldWidget(
    //           title: "Select State",
    //           keyboardType: TextInputType.text,
    //         ),
    //         AppLoginButton(
    //           color: AppColors.primaryOrange,
    //           title: "Back",
    //           onTap: () {
    //             setState(() {
    //               _containerNumber--;
    //             });
    //           },
    //         ),
    //       ],
    //     );

    //     _appLoginButton = StreamBuilder<bool>(
    //         stream: null,
    //         builder: (context, snapshot) {
    //           return AppLoginButton(
    //             color: AppColors.primaryBlue,
    //             title: "Proceed",
    //             onTap: () {
    //               print("Submit Pressed");
    //             },
    //           );
    //         });
    //     break;
    //   default:
    //     _containerNumber = 0;
    //     _child = Column(
    //       children: <Widget>[
    //         TextFieldWidget(
    //           title: "Name",
    //           keyboardType: TextInputType.text,
    //         ),
    //         TextFieldWidget(
    //           title: "Email",
    //           keyboardType: TextInputType.emailAddress,
    //         ),
    //         TextFieldWidget(
    //             title: "Mobile No.", keyboardType: TextInputType.number),
    //       ],
    //     );
    //     AppLoginButton(
    //       color: AppColors.primaryOrange,
    //       title: "Back",
    //       onTap: () {
    //         setState(() {
    //           _containerNumber--;
    //         });
    //       },
    //     );
    // }

    Widget screenTextField(
        {@required String placeholder,
        @required Function(String) validator,
        @required bool autoValidate,
        @required Function(String) onSaved,
        bool autofocus,
        bool showPassword,
        Widget onEyeClick,
        int maxLength,
        TextEditingController controller}) {
      return Container(
        margin: EdgeInsets.only(bottom: 5.0),
        child: SizedBox(
          height: 70,

          // constraints: const BoxConstraints(maxWidth: 500),
          // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            obscureText: showPassword == null ? false : !showPassword,
            validator: validator,
            maxLength: maxLength,
            controller: controller,
            autovalidate: autoValidate,
            decoration: InputDecoration(
              suffixIcon: onEyeClick == null ? null : onEyeClick,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              hintText: placeholder,
              focusedBorder: OutlineInputBorder(
                gapPadding: 10.0,
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 10.0,
              ),
              focusedErrorBorder: OutlineInputBorder(
                gapPadding: 10.0,
                borderSide: BorderSide(color: AppColors.red),
              ),
              errorBorder: OutlineInputBorder(
                gapPadding: 10.0,
                borderSide: BorderSide(color: AppColors.red),
              ),
              border: OutlineInputBorder(
                gapPadding: 10.0,
              ),
            ),
            onSaved: onSaved,
            autofocus: autofocus == null ? false : autofocus,
            maxLines: 1,
          ),
        ),
      );
    }

    return Consumer<SignupProvider>(
      builder: (_, signupProvider, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBarWidget.getAppBar(context, "Enter your details"),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: BaseStyles.topPadding),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Form(
                    key: signupProvider.signupFormKey,
                    child: Column(
                      children: <Widget>[
                        screenTextField(
                          onSaved: (String e) {
                            signupProvider.signup.name = e;
                          },
                          placeholder: "Enter your Name",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          autofocus: true,
                          validator: signupProvider.signupPageNameValidation,
                        ),
                        screenTextField(
                          onSaved: (String e) {
                            signupProvider.signup.email = e;
                          },
                          placeholder: "Enter your email",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          autofocus: true,
                          validator: signupProvider.signupPageEmailValidation,
                        ),
                        screenTextField(
                          onSaved: (String e) {
                            signupProvider.signup.password = e;
                          },
                          placeholder: "Enter your password",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          validator:
                              signupProvider.signupPagePasswordValidation,
                        ),
                        screenTextField(
                          controller: signupProvider.confirmPassword,
                          onSaved: null,
                          placeholder: "Confirm Password",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          validator: signupProvider
                              .signupPageConfirmPasswordValidation,
                        ),
                        screenTextField(
                          onSaved: (String e) {
                            signupProvider.signup.state = e;
                          },
                          placeholder: "Enter your State",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          validator:
                              signupProvider.signupPageStateCityValidation,
                        ),
                        screenTextField(
                          onSaved: (String e) {
                            signupProvider.signup.city = e;
                          },
                          placeholder: "Enter your city",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          validator:
                              signupProvider.signupPageStateCityValidation,
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: signupProvider.onceClicked
                                ? signupProvider.signupButtonCreateAccount(
                                    loader: true, onTap: () {})
                                : signupProvider.signupButtonCreateAccount(
                                    loader: false,
                                    onTap: () {
                                      signupProvider.validateForm();
                                      FocusScope.of(context).unfocus();
                                      signupProvider.setOnceFormValidated();
                                    },
                                  )),
                      ],
                    ),
                  )
                  // Text(
                  //   "Signup",
                  //   style: AppTextStyle.topHeading,
                  // ),
                  // SizedBox(height: 15.0),
                  // StreamBuilder<String>(
                  //     stream: _authBloc.nameStream,
                  //     builder: (context, snapshot) {
                  //       return TextFieldWidget(
                  //         title: "Name",
                  //         keyboardType: TextInputType.text,
                  //         onChanged: (String e) {
                  //           if (!onceClicked) {
                  //             // this._email = e;
                  //             this._signup.name = e;
                  //           } else {
                  //             _authBloc.nameSink(e);
                  //             this._signup.name = e;
                  //           }
                  //         },
                  //         errorText: snapshot.error,
                  //       );
                  //     }),
                  // StreamBuilder<String>(
                  //     stream: _authBloc.emailStream,
                  //     builder: (context, snapshot) {
                  //       return TextFieldWidget(
                  //         title: "Email",
                  //         keyboardType: TextInputType.emailAddress,
                  //         onChanged: (String e) {
                  //           if (!onceClicked) {
                  //             this._signup.email = e;
                  //           } else {
                  //             _authBloc.emailSink(e);
                  //             this._signup.email = e;
                  //           }
                  //         },
                  //         errorText: snapshot.error,
                  //       );
                  //     }),
                  // StreamBuilder<String>(
                  //     stream: _authBloc.mobileStream,
                  //     builder: (context, snapshot) {
                  //       return TextFieldWidget(
                  //         title: "Mobile No.",
                  //         keyboardType: TextInputType.number,
                  //         onChanged: (String e) {
                  //           if (!onceClicked) {
                  //             this._signup.mobile = e;
                  //           } else {
                  //             _authBloc.mobileSink(e);
                  //             this._signup.mobile = e;
                  //           }
                  //         },
                  //         errorText: snapshot.error,
                  //       );
                  //     }),
                  // StreamBuilder<String>(
                  //     stream: _authBloc.passwordStream,
                  //     builder: (context, snapshot) {
                  //       return TextFieldWidget(
                  //         title: "Password",
                  //         keyboardType: TextInputType.text,
                  //         isPassword: true,
                  //         passwordFieldType: PasswordFieldType.SignupField,
                  //         onChanged: (String e) {
                  //           if (!onceClicked) {
                  //             this._signup.password = e;
                  //           } else {
                  //             _authBloc.passwordSink(e);
                  //             this._signup.password = e;
                  //           }
                  //         },
                  //         errorText: snapshot.error,
                  //       );
                  //     }),
                  // StreamBuilder<String>(
                  //     stream: _authBloc.confirmpasswordStream,
                  //     builder: (context, snapshot) {
                  //       return TextFieldWidget(
                  //         title: "Confirm Password",
                  //         keyboardType: TextInputType.text,
                  //         isPassword: true,
                  //         errorText: snapshot.error,
                  //         onChanged: (String e) {
                  //           if (!onceClicked) {
                  //             this._signup.confirmPassword = e;
                  //           } else {
                  //             _authBloc.confirmPasswordSink(e);
                  //             this._signup.confirmPassword = e;
                  //           }
                  //         },
                  //         passwordFieldType: PasswordFieldType.SignupConfirmField,
                  //       );
                  //     }),
                  // AppLoginButton(
                  //   color: AppColors.primaryBlue,
                  //   onTap: () {},
                  //   title: "Create Account",
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
