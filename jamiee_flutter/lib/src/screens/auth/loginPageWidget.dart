import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../providers/auth/loginProvider.dart';
import '../../styles/colors.dart';

class LoginPageWidget extends StatelessWidget {
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
      height: 80,
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
              // SizedBox(
              //   height: 10.0,
              // ),
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
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    // margin:
                    //     const EdgeInsets.symmetric(vertical: 10),
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
                          ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      color: Colors.transparent,
                      onPressed: () {},
                      child: Text("Forgot Password"),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
