import '../../../styles/text.dart';
import '../../../utils/onWillPopScope.dart';
import '../../../widgets/pageHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/validationRegex.dart';
import 'package:provider/provider.dart';
import '../../../widgets/appTextFields/appTextField.dart';
import '../../../providers/auth/signup/signupProvider.dart';
import '../../../widgets/appBar.dart';
import '../../../styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupProvider(),
      child: SignupWidget(),
    );
  }
}

class SignupWidget extends StatefulWidget {
  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  FocusNode lastName;
  FocusNode emailNode;
  FocusNode passwordNode;
  FocusNode confirmPasswordNode;

  @override
  void initState() {
    super.initState();
    lastName = FocusNode();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    confirmPasswordNode = FocusNode();
  }

  @override
  void dispose() {
    lastName.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    confirmPasswordNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);

    print("+++++++++Signup Build+++++++++");
    return Consumer<SignupProvider>(
      builder: (_, signupProvider, child) {
        return WillPopScope(
          onWillPop: () => appConfirmRemoveScreenDialog(context),
          child: Scaffold(
            key: signupProvider.signupScaffoldKey,
            backgroundColor: AppColors.white,
            appBar: AppBarWidget.getAppBar(context, "", isRegistration: true),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(right: 15.0.w, left: 15.0.w),
                child: Column(
                  children: <Widget>[
                    Form(
                      key: signupProvider.signupFormKey,
                      // ignore: deprecated_member_use
                      autovalidate: signupProvider.pageModel.onceFormSubmitted,
                      child: Column(
                        children: <Widget>[
                          PageHeading.topHeading(
                            title: "Signup Details",
                            subTitle:
                                "Please enter your details to complete registration.",
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 50.0) /
                                        2,
                                child: AppTextField.screenTextField(
                                  height: 75.h,
                                  prefixIcon: Icons.account_circle,
                                  edge: EdgeInsets.only(left: 20.0),
                                  onSaved: (String e) {
                                    signupProvider.signup.firstName = e;
                                  },
                                  onEdittingComplete: () {
                                    lastName.requestFocus();
                                  },
                                  hintText: "First Name",
                                  autoValidate: signupProvider
                                      .pageModel.onceFormSubmitted,
                                  autofocus: false,
                                  validator: TextFieldValidation.nameValidation,
                                ),
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 50.0) /
                                        2,
                                child: AppTextField.screenTextField(
                                  height: 75.h,
                                  edge: EdgeInsets.only(left: 20.0),
                                  focusNode: lastName,
                                  prefixIcon: Icons.account_circle,
                                  onSaved: (String e) {
                                    signupProvider.signup.lastName = e;
                                  },
                                  onEdittingComplete: () {
                                    emailNode.requestFocus();
                                  },
                                  hintText: "Last Name",
                                  autoValidate: signupProvider
                                      .pageModel.onceFormSubmitted,
                                  autofocus: false,
                                  validator: TextFieldValidation.nameValidation,
                                ),
                              ),
                            ],
                          ),
                          AppTextField.screenTextField(
                            height: 75.h,
                            prefixIcon: Icons.email,
                            focusNode: emailNode,
                            textInputType: TextInputType.emailAddress,
                            onSaved: (String e) {
                              signupProvider.signup.email = e;
                            },
                            onEdittingComplete: () =>
                                passwordNode.requestFocus(),
                            hintText: "Email",
                            autoValidate:
                                signupProvider.pageModel.onceFormSubmitted,
                            validator: TextFieldValidation.emailValidation,
                          ),
                          AppTextField.screenTextField(
                            height: 75.h,
                            focusNode: passwordNode,
                            prefixIcon: Icons.lock,
                            showPassword: false,
                            controller: signupProvider.password,
                            onSaved: (String e) {
                              signupProvider.signup.password = e;
                            },
                            onEdittingComplete: () =>
                                confirmPasswordNode.requestFocus(),
                            hintText: "Password",
                            autoValidate:
                                signupProvider.pageModel.onceFormSubmitted,
                            validator: TextFieldValidation.passwordValidation,
                          ),
                          AppTextField.screenTextField(
                            height: 75.h,
                            prefixIcon: Icons.lock,
                            focusNode: confirmPasswordNode,
                            showPassword: false,
                            onSaved: null,
                            hintText: "Confirm Password",
                            autoValidate:
                                signupProvider.pageModel.onceFormSubmitted,
                            validator: signupProvider
                                .signupPageConfirmPasswordValidation,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "By clicking Sign Up,you agree to our",
                              style: AppTextStyle.dontHaveAccount,
                              children: [
                                TextSpan(
                                    text: " Term's ",
                                    style: AppTextStyle.createOne),
                                TextSpan(
                                    text: "and that you have read our",
                                    style: AppTextStyle.dontHaveAccount),
                                TextSpan(
                                    text: " Privacy policy.",
                                    style: AppTextStyle.createOne),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            height: 0.07.hp,
                            child: signupProvider.signupButtonCreateAccount(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                signupProvider.validateForm(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
