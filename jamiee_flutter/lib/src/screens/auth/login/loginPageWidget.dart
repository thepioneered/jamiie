import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/validationRegex.dart';
import '../../../widgets/appTextFields/appTextField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../providers/auth/login/loginProvider.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  FocusNode passwordNode;
  @override
  void initState() {
    super.initState();

    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
print("DISPOSED");
    passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("+++++LOGIN WIDGET REBUILD+++++");
    return Consumer<LoginProvider>(
      builder: (_, loginProvider, child) {
        return Form(
          key: loginProvider.loginFormKey,
          child: Column(
            children: <Widget>[
              AppTextField.screenTextField(
                  prefixIcon: Icons.phone,
                  onEdittingComplete: () => passwordNode.requestFocus(),
                  maxLength: 10,
                  hintText: "Mobile",
                  autofocus: false,
                  validator: TextFieldValidation.mobileValidation,
                  autoValidate: loginProvider.onceFormSubmitted ? true : false,
                  onSaved: (String e) => loginProvider.login.mobile = e,
                  textInputType: TextInputType.number),
              ChangeNotifierProvider(
                create: (context) => PasswordStatusLogin(),
                child: Consumer<PasswordStatusLogin>(
                  builder: (_, passwordStatus, child) {
                    return AppTextField.screenTextField(
                      autofocus: false,
                      focusNode: passwordNode,
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
