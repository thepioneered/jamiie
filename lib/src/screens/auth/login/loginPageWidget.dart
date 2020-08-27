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
    passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("+++++LOGIN WIDGET REBUILD+++++");
    double height = MediaQuery.of(context).size.height - 75.0;
    print(height);
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
                  autoValidate: loginProvider.pageModel.onceFormSubmitted,
                  onSaved: (String e) => loginProvider.login.setMobile(e),
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
                      autoValidate: loginProvider.pageModel.onceFormSubmitted,
                      onSaved: (String e) => loginProvider.login.password = e,
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
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: height * 0.07,
                child: loginProvider.loginButton(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    loginProvider.validateLoginForm();
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
