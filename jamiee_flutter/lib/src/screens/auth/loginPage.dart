import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jamiee_flutter/src/providers/auth/loginProvider.dart';

import '../../styles/colors.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  Widget screenTextField(
      {@required String placeholder,
      @required Function(String) validator,
      @required bool autoValidate,
      @required Function(String) onSaved,
      bool autofocus,
      bool showPassword,
      Widget onEyeClick,
      int maxLength}) {
    return SizedBox(
      height: 70,
      // constraints: const BoxConstraints(maxWidth: 500),
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        obscureText: showPassword == null ? false : !showPassword,
        validator: validator,
        maxLength: maxLength,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (_, loginProvider, child) {
        return Form(
          key: loginProvider.loginFormKey,
          child: Column(
            children: <Widget>[
              screenTextField(
                maxLength: 10,
                placeholder: "+1 Enter your mobile number",
                validator: loginProvider.loginPageMobileValidation,
                autoValidate: loginProvider.onceFormSubmitted ? true : false,
                onSaved: (String e) => loginProvider.login.mobile = e,
              ),
              SizedBox(
                height: 10.0,
              ),
              Consumer<PasswordStatusLogin>(
                  builder: (_, passwordStatus, child) {
                return screenTextField(
                    placeholder: "Enter your password",
                    showPassword: passwordStatus.showPassword,
                    validator: loginProvider.loginPagePasswordValidation,
                    autoValidate:
                        loginProvider.onceFormSubmitted ? true : false,
                    onSaved: (String e) => loginProvider.login.setPassword(e),
                    onEyeClick: GestureDetector(
                      onTap: passwordStatus.setStatus,
                      child: Icon(passwordStatus.showPassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash),
                    ));
              }),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: loginProvider.onceClicked
                      ? loginProvider.loginButton(loader: true, onTap: () {})
                      : loginProvider.loginButton(
                          loader: false,
                          onTap: () {
                            loginProvider.validateLoginForm();
                            FocusScope.of(context).unfocus();
                            loginProvider.setOnceFormValidated();
                          },
                        )),
            ],
          ),
        );
      },
    );
  }
}

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   Login _login = Login();
//   bool onceClicked = false;
//   AuthBloCLogin check = AuthBloCLogin();

//   @override
//   void dispose() {
//     super.dispose();
//     check.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         StreamBuilder<String>(
//           stream: check.emailLoginStream,
//           builder: (context, snapshot) {
//             return Container(
//               height: 40,
//               constraints: const BoxConstraints(maxWidth: 500),
//               margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: CupertinoTextField(
//                 onChanged: (String e) {
//                   if (!onceClicked) {
//                     // this._email = e;
//                     this._login.email = e;
//                   } else {
//                     check.emailLoginSink(e);
//                     this._login.email = e;
//                   }
//                 },
//                 toolbarOptions: ToolbarOptions(
//                   copy: false,
//                   cut: false,
//                   selectAll: false,
//                   paste: false,
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.primaryColorLight),
//                   color: Colors.white,
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(4),
//                   ),
//                 ),
//                 maxLength: 10,
//                 clearButtonMode: OverlayVisibilityMode.editing,
//                 keyboardType: TextInputType.phone,
//                 maxLines: 1,
//                 placeholder: 'Enter your email',
//               ),
//             );
//             // return TextFieldWidget(
//             //   title: "Email",
//             //   keyboardType: TextInputType.emailAddress,
//             // onChanged: (String e) {
//             //   if (!onceClicked) {
//             //     // this._email = e;
//             //     this._login.email = e;
//             //   } else {
//             //     check.emailLoginSink(e);
//             //     this._login.email = e;
//             //   }
//             // },
//             //   errorText: snapshot.error,
//             // );
//           },
//         ),
//         StreamBuilder<String>(
//             stream: check.passwordLoginStream,
//             builder: (context, snapshot) {
//               return TextFieldWidget(
//                 title: "Password",
//                 isPassword: true,
//                 keyboardType: TextInputType.text,
//                 onChanged: (String e) {
//                   if (!onceClicked) {
//                     // this._email = e;
//                     this._login.password = e;
//                   } else {
//                     check.passwordLoginSink(e);
//                     this._login.password = e;
//                   }
//                 },
//                 errorText: snapshot.error,
//                 passwordFieldType: PasswordFieldType.LoginField,
//               );
//             }),
//         SizedBox(
//           height: 20.0,
//         ),
//         StreamBuilder<bool>(
//             stream: check.isValidLogin,
//             builder: (context, snapshot) {
//               return AppLoginButton(
//                 title: "Login",
//                 color: AppColors.primaryBlue,
//                 onTap: () {
//                   if (!onceClicked) {
//                     this._login.email != null
//                         ? check.emailLoginSink(this._login.email)
//                         : check.emailLoginSink("null");
//                     this._login.password != null
//                         ? check.passwordLoginSink(this._login.password)
//                         : check.passwordLoginSink("null");
//                   }

//                   onceClicked = true;
//                   Navigator.pushReplacementNamed(context, "/NavBar");

//                   //TODO: Login Request will be made under this
//                   //TODO: Logic need's to be shift
//                   if (!snapshot.hasError &&
//                       _login.email != null &&
//                       _login.password != null) {
//                     FocusScope.of(context).unfocus();

//                     // AppCheck.check(context,
//                     //     "{${_login.email.replaceAll(" ", "")},${_login.password}}");
//                   }
//                 },
//               );
//             })
//       ],
//     );
//   }
// }
