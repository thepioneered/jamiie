import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/auth/forgotPassword/FPnewPasswordProvider.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:jamiee_flutter/src/utils/validationRegex.dart';
import 'package:jamiee_flutter/src/widgets/appBar.dart';
import 'package:jamiee_flutter/src/widgets/appTextFields/appTextField.dart';
import 'package:jamiee_flutter/src/widgets/button/appButton.dart';
import 'package:provider/provider.dart';

class NewPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var newPasswordProvider = Provider.of<NewPasswordProvider>(context);
    return Scaffold(
      key: newPasswordProvider.newpassScaffoldKey,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          height: MediaQuery.of(context).size.height - 75.0,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "New Password",
                  style: AppTextStyle.authHeading,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter your new password.",
                  style: AppTextStyle.forgotPasswordSubTitle,
                ),
              ),
              Form(
                key: newPasswordProvider.newpassFormKey,
                child: Column(
                  children: [
                    AppTextField.screenTextField(
                        hintText: "Password",
                        showPassword: false,
                        validator: TextFieldValidation.passwordValidation,
                        autoValidate: newPasswordProvider.onceFormSubmitted,
                        controller: newPasswordProvider.password,
                        onSaved: null,
                        prefixIcon: Icons.lock),
                    AppTextField.screenTextField(
                        hintText: "Confrim Password",
                        showPassword: false,
                        validator:
                            newPasswordProvider.confirmPasswordValidation,
                        autoValidate: newPasswordProvider.onceFormSubmitted,
                        onSaved: (e) => newPasswordProvider.confirmPassword = e,
                        prefixIcon: Icons.lock),
                    newPasswordProvider.onceClicked
                        ? newPasswordProvider.updatePasswordButton(true, () {})
                        : newPasswordProvider.updatePasswordButton(false, () {
                            // Focus.of(context).unfocus();
                            newPasswordProvider.updateNewPassword();
                          }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
