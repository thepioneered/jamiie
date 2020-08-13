import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jamiee_flutter/src/utils/validationRegex.dart';
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
  Widget build(BuildContext context) {
    print("+++++++++Signup Build+++++++++");
    return Consumer<SignupProvider>(
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
                                      image:
                                          FileImage(imageProviderSignup.image),
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
                          hintText: "Name",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          autofocus: true,
                          validator: TextFieldValidation.nameValidation,
                        ),
                        AppTextField.screenTextField(
                          prefixIcon: Icons.email,
                          textInputType: TextInputType.emailAddress,
                          onSaved: (String e) {
                            signupProvider.signup.email = e;
                          },
                          hintText: "Email",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          autofocus: true,
                          validator: TextFieldValidation.emailValidation,
                        ),
                        ChangeNotifierProvider(
                          create: (_) => PasswordStatusSignUp(),
                          child: Consumer<PasswordStatusSignUp>(
                            builder: (_, showPassword, child) {
                              return AppTextField.screenTextField(
                                prefixIcon: Icons.lock,
                                controller: signupProvider.password,
                                onSaved: (String e) {
                                  signupProvider.signup.setPassword(e);
                                },
                                hintText: "Password",
                                showPassword: showPassword.showPassword,
                                autoValidate: signupProvider.onceFormValidated
                                    ? true
                                    : false,
                                validator:
                                    TextFieldValidation.passwordValidation,
                              );
                            },
                          ),
                        ),
                        ChangeNotifierProvider(
                          create: (_) => PasswordStatusSignUp(),
                          child: Consumer<PasswordStatusSignUp>(
                            builder: (_, showPassword, child) {
                              return AppTextField.screenTextField(
                                prefixIcon: Icons.lock,
                                showPassword: showPassword.confirmShowPassword,
                                onSaved: null,
                                hintText: "Confirm Password",
                                autoValidate: signupProvider.onceFormValidated
                                    ? true
                                    : false,
                                validator: signupProvider
                                    .signupPageConfirmPasswordValidation,
                                // onEyeClick: GestureDetector(
                                //   onTap: showPassword.setStateConfirmPassword,
                                //   child: Icon(showPassword.confirmShowPassword
                                //       ? FontAwesomeIcons.eye
                                //       : FontAwesomeIcons.eyeSlash),
                                // ),
                              );
                            },
                          ),
                        ),
                        AppTextField.screenTextField(
                          prefixIcon: null,
                          onSaved: (String e) {
                            signupProvider.signup.state = e;
                          },
                          hintText: "Enter your State",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          validator: TextFieldValidation.stateCityValidation,
                        ),
                        AppTextField.screenTextField(
                          prefixIcon: null,
                          onSaved: (String e) {
                            signupProvider.signup.city = e;
                          },
                          hintText: "Enter your city",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          validator: TextFieldValidation.stateCityValidation,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: signupProvider.onceClicked
                              ? signupProvider.signupButtonCreateAccount(
                                  loader: true, onTap: () {})
                              : signupProvider.signupButtonCreateAccount(
                                  loader: false,
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    signupProvider.validateForm(context);
                                    signupProvider.setOnceFormValidated();
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
    );
  }
}
