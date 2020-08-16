import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/utils/onWillPopScope.dart';
import 'package:Jamiie/src/widgets/pageHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    emailNode.dispose();
    passwordNode.dispose();
    confirmPasswordNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.only(right: 15.0, left: 15.0, top: 30.0),
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
                            // PageHeading.topHeading(
                            //     title: "Signup Details",
                            //     subTitle:
                            //         "Please enter your details to complete registration."),
                            Row(
                              children: [
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                          30.0) /
                                      2,
                                  child: Column(
                                    children: [
                                      AppTextField.screenTextField(
                                        prefixIcon: Icons.account_circle,
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
                                      AppTextField.screenTextField(
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
                                    ],
                                  ),
                                ),
                                ChangeNotifierProvider(
                                  create: (context) => ImageProviderSignup(),
                                  child: Consumer<ImageProviderSignup>(
                                    builder: (_, imageProviderSignup, child) {
                                      return Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            bottom: 35.0, left: 30.0),
                                        height: 160.0,
                                        // color: Colors.pink,
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    30.0) /
                                                2,
                                        // child: Text("A"),
                                        child: imageProviderSignup.image == null
                                            ? InkWell(
                                                onTap: imageProviderSignup
                                                    .getImage,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 120.0,
                                                  width: 120.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .primaryColorPurple,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                      FontAwesomeIcons.camera,
                                                      color: AppColors.white),
                                                ),
                                              )
                                            : Container(
                                                alignment: Alignment.center,
                                                height: 80.0,
                                                width: 80.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                          imageProviderSignup
                                                              .image),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                      );
                                    },
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
                                signupProvider.signup.setPassword(e);
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                          50.0) /
                                      2,
                                  child: AppTextField.screenTextField(
                                    prefixIcon: null,
                                    onSaved: (String e) {
                                      signupProvider.signup.state = e;
                                    },
                                    hintText: "State",
                                    autoValidate: signupProvider
                                        .pageModel.onceFormSubmitted,
                                    validator:
                                        TextFieldValidation.stateCityValidation,
                                  ),
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                          50.0) /
                                      2,
                                  child: AppTextField.screenTextField(
                                    prefixIcon: null,
                                    onSaved: (String e) {
                                      signupProvider.signup.city = e;
                                    },
                                    hintText: "City",
                                    autoValidate: signupProvider
                                        .pageModel.onceFormSubmitted,
                                    validator:
                                        TextFieldValidation.stateCityValidation,
                                  ),
                                ),
                              ],
                            ),
                            AppTextField.screenTextField(
                              toolbarOptions: ToolbarOptions(
                                  copy: false,
                                  paste: false,
                                  cut: false,
                                  selectAll: false),
                              prefixIcon: FontAwesomeIcons.shieldAlt,
                              textInputType: TextInputType.number,
                              maxLength: 9,
                              onSaved: (String e) {
                                signupProvider.signup.socialNumber = e;
                              },
                              onEdittingComplete: () {},
                              hintText: "Social Security Number",
                              autoValidate:
                                  signupProvider.pageModel.onceFormSubmitted,
                              autofocus: false,
                              validator: TextFieldValidation.socialNumber,
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
                              height: 15.0,
                            ),
                            Container(
                              child: signupProvider.pageModel.onceClicked
                                  ? signupProvider.signupButtonCreateAccount(
                                      loader: true, onTap: () {})
                                  : signupProvider.signupButtonCreateAccount(
                                      loader: false,
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        signupProvider.validateForm(context);
                                      },
                                    ),
                            ),
                            SizedBox(
                              height: 30.0,
                            )
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
