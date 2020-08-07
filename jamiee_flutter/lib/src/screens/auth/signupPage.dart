import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/auth/signupProvider.dart';
import '../../widgets/appBar.dart';
import '../../styles/colors.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Widget screenTextField(
      {@required String placeholder,
      @required Function(String) validator,
      @required bool autoValidate,
      @required Function(String) onSaved,
      bool autofocus,
      bool showPassword,
      Widget onEyeClick,
      int maxLength,
      TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      child: SizedBox(
        height: 70,
        child: TextFormField(
          obscureText: showPassword == null ? false : !showPassword,
          validator: validator,
          maxLength: maxLength,
          controller: controller,
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
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    print("+++++++++Signup Build+++++++++");
    return Consumer<SignupProvider>(
      builder: (_, signupProvider, child) {
        return Scaffold(
          key: signupProvider.signupScaffoldKey,
          backgroundColor: AppColors.white,
          appBar: AppBarWidget.getAppBar(context, "Enter your details"),
          body: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height - 75.0,
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
                                  height: 100.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColorLight,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(FontAwesomeIcons.camera,
                                      color: AppColors.white),
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                height: 100.0,
                                width: 100.0,
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
                        screenTextField(
                          onSaved: (String e) {
                            signupProvider.signup.name = e;
                          },
                          placeholder: "Enter your Name",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          autofocus: true,
                          validator: signupProvider.signupPageNameValidation,
                        ),
                        screenTextField(
                          onSaved: (String e) {
                            signupProvider.signup.email = e;
                          },
                          placeholder: "Enter your email",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          autofocus: true,
                          validator: signupProvider.signupPageEmailValidation,
                        ),
                        ChangeNotifierProvider(
                          create: (_) => PasswordStatusSignUp(),
                          child: Consumer<PasswordStatusSignUp>(
                              builder: (_, showPassword, child) {
                            return screenTextField(
                                controller: signupProvider.password,
                                onSaved: (String e) {
                                  signupProvider.signup.setPassword(e);
                                },
                                placeholder: "Enter your password",
                                showPassword: showPassword.showPassword,
                                autoValidate: signupProvider.onceFormValidated
                                    ? true
                                    : false,
                                validator:
                                    signupProvider.signupPagePasswordValidation,
                                onEyeClick: GestureDetector(
                                  onTap: showPassword.setStatusPassword,
                                  child: Icon(showPassword.showPassword
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash),
                                ));
                          }),
                        ),
                        ChangeNotifierProvider(
                          create: (_) => PasswordStatusSignUp(),
                          child: Consumer<PasswordStatusSignUp>(
                              builder: (_, showPassword, child) {
                            return screenTextField(
                                showPassword: showPassword.confirmShowPassword,
                                onSaved: null,
                                placeholder: "Confirm Password",
                                autoValidate: signupProvider.onceFormValidated
                                    ? true
                                    : false,
                                validator: signupProvider
                                    .signupPageConfirmPasswordValidation,
                                onEyeClick: GestureDetector(
                                  onTap: showPassword.setStateConfirmPassword,
                                  child: Icon(showPassword.confirmShowPassword
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash),
                                ));
                          }),
                        ),
                        screenTextField(
                          onSaved: (String e) {
                            signupProvider.signup.state = e;
                          },
                          placeholder: "Enter your State",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          validator:
                              signupProvider.signupPageStateCityValidation,
                        ),
                        screenTextField(
                          onSaved: (String e) {
                            signupProvider.signup.city = e;
                          },
                          placeholder: "Enter your city",
                          autoValidate:
                              signupProvider.onceFormValidated ? true : false,
                          validator:
                              signupProvider.signupPageStateCityValidation,
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            constraints: const BoxConstraints(maxWidth: 150),
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
                                  )),
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
