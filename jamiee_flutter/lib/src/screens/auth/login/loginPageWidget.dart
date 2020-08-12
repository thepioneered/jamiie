import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:jamiee_flutter/src/widgets/appTextFields/appTextField.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../providers/auth/login/loginProvider.dart';
import '../../../styles/colors.dart';

class LoginPageWidget extends StatelessWidget {
  // Widget screenTextField(
  //     {@required String placeholder,
  //     @required Function(String) validator,
  //     @required bool autoValidate,
  //     @required Function(String) onSaved,
  //     bool autofocus,
  //     bool showPassword,
  //     Widget onEyeClick,
  //     int maxLength,
  //     @required IconData prefixIcon,
  //     TextInputType textInputType}) {
  //   return SizedBox(
  //     height: 80,
  //     child: TextFormField(
  //       keyboardType: textInputType,
  //       obscureText: showPassword == null ? false : !showPassword,
  //       validator: validator,
  //       maxLength: maxLength,
  //       autovalidate: autoValidate,
  //       decoration: InputDecoration(
  //         prefixIcon: Icon(prefixIcon),
  //         suffixIcon: onEyeClick == null ? null : onEyeClick,
  //         contentPadding: const EdgeInsets.symmetric(horizontal: 16),
  //         hintText: placeholder,
  //         hintStyle: AppTextStyle.logoutTitle,
  //         focusedBorder: OutlineInputBorder(
  //           gapPadding: 10.0,
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           gapPadding: 10.0,
  //         ),
  //         focusedErrorBorder: OutlineInputBorder(
  //           gapPadding: 10.0,
  //           borderSide: BorderSide(color: AppColors.red),
  //         ),
  //         errorBorder: OutlineInputBorder(
  //           gapPadding: 10.0,
  //           borderSide: BorderSide(color: AppColors.red),
  //         ),
  //         border: OutlineInputBorder(
  //           gapPadding: 10.0,
  //         ),
  //       ),
  //       onSaved: onSaved,
  //       autofocus: autofocus == null ? false : autofocus,
  //       maxLines: 1,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (_, loginProvider, child) {
        return Form(
          key: loginProvider.loginFormKey,
          child: Column(
            children: <Widget>[
              AppTextField.screenTextField(
                  prefixIcon: Icons.phone,
                  maxLength: 10,
                  hintText: "Mobile",
                  validator: loginProvider.loginPageMobileValidation,
                  autoValidate: loginProvider.onceFormSubmitted ? true : false,
                  onSaved: (String e) => loginProvider.login.mobile = e,
                  textInputType: TextInputType.number),
              Consumer<PasswordStatusLogin>(
                builder: (_, passwordStatus, child) {
                  return AppTextField.screenTextField(
                    prefixIcon: Icons.lock,
                    hintText: "Password",
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
                    ),
                  );
                },
              ),
              Container(
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
            ],
          ),
        );
      },
    );
  }
}
