import 'package:jamiee_flutter/src/utils/validationRegex.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../styles/text.dart';
import '../../../widgets/appTextFields/appTextField.dart';
import '../../../providers/auth/forgotPassword/FPmobileProvider.dart';
import '../../../styles/colors.dart';
import '../../../widgets/appBar.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(
      builder: (_, forgotPasswordProvider, child) {
        print("Forgot Password Page rebuild");
        return Scaffold(
          key: forgotPasswordProvider.forgotPasswordScaffoldKey,
          backgroundColor: AppColors.white,
          appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
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
                      "Forgot Password?",
                      style: AppTextStyle.authHeading,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Enter your mobile number to reset your password.",
                      style: AppTextStyle.forgotPasswordSubTitle,
                    ),
                  ),
                  Form(
                    key: forgotPasswordProvider.forgotPasswordFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppTextField.screenTextField(
                          textInputType: TextInputType.number,
                          maxLength: 10,
                          prefixIcon: Icons.phone,
                          hintText: "Mobile",
                          validator: TextFieldValidation.mobileValidation,
                          autoValidate:
                              forgotPasswordProvider.onceFormsubmitted,
                          onSaved: (String e) =>
                              forgotPasswordProvider.mobile = e,
                        ),
                        forgotPasswordProvider.onceClicked
                            ? CupertinoActivityIndicator()
                            : forgotPasswordProvider.sendOtpButton(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  forgotPasswordProvider.forgotPassword();
                                },
                                loader: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
