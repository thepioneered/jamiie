import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/validationRegex.dart';
import '../../../widgets/appTextFields/appTextField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../providers/auth/login/loginProvider.dart';

class LoginPageWidget extends StatelessWidget {
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
                  validator: TextFieldValidation.mobileValidation,
                  autoValidate: loginProvider.onceFormSubmitted ? true : false,
                  onSaved: (String e) => loginProvider.login.mobile = e,
                  textInputType: TextInputType.number),
              Consumer<PasswordStatusLogin>(
                builder: (_, passwordStatus, child) {
                  return AppTextField.screenTextField(
                    prefixIcon: Icons.lock,
                    hintText: "Password",
                    showPassword: passwordStatus.showPassword,
                    validator: TextFieldValidation.passwordValidation,
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
