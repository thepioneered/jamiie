import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:jamiee_flutter/src/widgets/appTextFields/appTextField.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../providers/auth/forgotPassword/FPmobileProvider.dart';
import '../../../styles/colors.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/button.dart';

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
                        validator:
                            forgotPasswordProvider.loginPageMobileValidation,
                        autoValidate: forgotPasswordProvider.onceFormsubmitted,
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
    });
  }
  // @override
  // Widget build(BuildContext context) {
  //   var forgotPasswordProvider = Provider.of<ForgotPasswordProvider>(context);
  //   return Scaffold(
  //       key: forgotPasswordProvider.forgotPasswordScaffoldKey,
  //       backgroundColor: AppColors.white,
  //       appBar: AppBarWidget.getAppBar(
  //         context,
  //         "Forgot Password",
  //         isRegistration: false,
  //       ),
  //       body: Container(
  //         padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
  //         child: Form(
  //           key: forgotPasswordProvider.forgotPasswordFormKey,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               screenTextField(
  //                 placeholder: "Enter your mobile",
  //                 validator: forgotPasswordProvider.loginPageMobileValidation,
  //                 autoValidate: forgotPasswordProvider.onceFormsubmitted,
  //                 onSaved: (String e) => forgotPasswordProvider.mobile = e,
  //               ),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               forgotPasswordProvider.onceClicked
  //                   ? CupertinoActivityIndicator()
  //                   : AppLoginButton()
  //                       .appRaisedButton(forgotPasswordProvider.forgotPassword),
  //             ],
  //           ),
  //         ),
  //       ));
  // }

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
      width: double.infinity,
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
        keyboardType: TextInputType.number,
      ),
    );
  }
}
