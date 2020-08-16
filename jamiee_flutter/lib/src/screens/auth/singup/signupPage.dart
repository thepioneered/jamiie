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
  FocusNode emailNode;
  FocusNode passwordNode;
  FocusNode confirmPasswordNode;
  @override
  void initState() {
    super.initState();
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
          return Scaffold(
            key: signupProvider.signupScaffoldKey,
            backgroundColor: AppColors.white,
            appBar: AppBarWidget.getAppBar(context, "", isRegistration: true),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ChangeNotifierProvider(
                      create: (context) => ImageProviderSignup(),
                      child: Consumer<ImageProviderSignup>(
                        builder: (_, imageProviderSignup, child) {
                          return imageProviderSignup.image == null
                              ? InkWell(
                                  onTap: imageProviderSignup.getImage,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 80.0,
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColorPurple,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(FontAwesomeIcons.camera,
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
                                            imageProviderSignup.image),
                                        fit: BoxFit.fill),
                                  ),
                                );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: signupProvider.signupFormKey,
                      child: Column(
                        children: <Widget>[
                          AppTextField.screenTextField(
                            prefixIcon: Icons.account_circle,
                            onSaved: (String e) {
                              signupProvider.signup.name = e;
                            },
                            onEdittingComplete: () {
                              emailNode.requestFocus();
                            },
                            hintText: "Name",
                            autoValidate:
                                signupProvider.pageModel.onceFormSubmitted,
                            autofocus: false,
                            validator: TextFieldValidation.nameValidation,
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
                          AppTextField.screenTextField(
                            prefixIcon: null,
                            onSaved: (String e) {
                              signupProvider.signup.state = e;
                            },
                            hintText: "Enter your State",
                            autoValidate:
                                signupProvider.pageModel.onceFormSubmitted,
                            validator: TextFieldValidation.stateCityValidation,
                          ),
                          AppTextField.screenTextField(
                            prefixIcon: null,
                            onSaved: (String e) {
                              signupProvider.signup.city = e;
                            },
                            hintText: "Enter your city",
                            autoValidate:
                                signupProvider.pageModel.onceFormSubmitted,
                            validator: TextFieldValidation.stateCityValidation,
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
