import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/utils/onWillPopScope.dart';
import 'package:Jamiie/src/widgets/pageHeading.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/validationRegex.dart';
import 'package:provider/provider.dart';
import '../../../widgets/appTextFields/appTextField.dart';
import '../../../providers/auth/signup/signupProvider.dart';
import '../../../widgets/appBar.dart';
import '../../../styles/colors.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
    double height = MediaQuery.of(context).size.height;
    print("+++++++++Signup Build+++++++++");
    return ChangeNotifierProvider(
      create: (context) => SignupProvider(),
      child: Consumer<SignupProvider>(
        builder: (_, signupProvider, child) {
          return WillPopScope(
            onWillPop: () => appConfirmRemoveScreenDialog(context),
            child: Scaffold(
              key: signupProvider.signupScaffoldKey,
              backgroundColor: AppColors.white,
              appBar: AppBarWidget.getAppBar(context, "", isRegistration: true),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(right: 15.0, left: 15.0),
                  // height: MediaQuery.of(context).size.height - 75.0,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: signupProvider.signupFormKey,
                        autovalidate:
                            signupProvider.pageModel.onceFormSubmitted,
                        child: Column(
                          children: <Widget>[
                            PageHeading.topHeading(
                                height: height,
                                title: "Signup Details",
                                subTitle:
                                    "Please enter your details to complete registration."),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                          50.0) /
                                      2,
                                  child: AppTextField.screenTextField(
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
                                    validator:
                                        TextFieldValidation.nameValidation,
                                  ),
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                          50.0) /
                                      2,
                                  child: AppTextField.screenTextField(
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
                                    validator:
                                        TextFieldValidation.nameValidation,
                                  ),
                                ),
                               
                              ],
                            ),
                            AppTextField.screenTextField(
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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       width: (MediaQuery.of(context).size.width -
                            //               50.0) /
                            //           2,
                            //       child: AppTextField.screenTextField(
                            //         prefixIcon: null,
                            //         onSaved: (String e) {
                            //           signupProvider.signup.state = e;
                            //         },
                            //         hintText: "State",
                            //         onEdittingComplete: () {
                            //           cityNode.requestFocus();
                            //         },
                            //         focusNode: stateNode,
                            //         autoValidate: signupProvider
                            //             .pageModel.onceFormSubmitted,
                            //         validator:
                            //             TextFieldValidation.stateCityValidation,
                            //       ),
                            //     ),
                            //     Container(
                            //       width: (MediaQuery.of(context).size.width -
                            //               50.0) /
                            //           2,
                            //       child: AppTextField.screenTextField(
                            //         prefixIcon: null,
                            //         onSaved: (String e) {
                            //           signupProvider.signup.city = e;
                            //         },
                            //         onEdittingComplete: () {
                            //           socialNumber.requestFocus();
                            //         },
                            //         hintText: "City",
                            //         focusNode: cityNode,
                            //         autoValidate: signupProvider
                            //             .pageModel.onceFormSubmitted,
                            //         validator:
                            //             TextFieldValidation.stateCityValidation,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          

                            Container(
                                height: height * 0.1,
                                // color: Colors.blueAccent,
                                child: AutoSizeText(
                                  "By clicking Sign Up,you agree to our Term's and that you have read our Privacy policy.",
                                  style: AppTextStyle.dontHaveAccount,
                                  minFontSize: 15.0,
                                  maxLines: 2,
                                )

                                // RichText(
                                //   text: TextSpan(
                                //     text: "By clicking Sign Up,you agree to our",
                                //     style: AppTextStyle.dontHaveAccount,
                                //     children: [
                                //       TextSpan(
                                //           text: " Term's ",
                                //           style: AppTextStyle.createOne),
                                //       TextSpan(
                                //           text: "and that you have read our",
                                //           style: AppTextStyle.dontHaveAccount),
                                //       TextSpan(
                                //           text: " Privacy policy.",
                                //           style: AppTextStyle.createOne),
                                //     ],
                                //   ),
                                // ),
                                ),
                            // SizedBox(
                            //   height: 15.0,
                            // ),
                            Container(
                              height: height * 0.07,
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
      ),
    );
  }
}
