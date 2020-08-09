import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/signup.dart';
import '../../providers/auth/mobileProvider.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../server/statusCode.dart';
import '../../styles/colors.dart';
import '../../utils/validationRegex.dart';

class SignupProvider extends ChangeNotifier {
  //Page Variables and keys
  GlobalKey<ScaffoldState> signupScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  Signup signup;
  bool onceClicked;
  bool onceFormValidated;
  TextEditingController password;

  //Class Constructor
  SignupProvider() {
    password = TextEditingController();

    signup = Signup();

    onceClicked = false;
    onceFormValidated = false;
  }

  //Page Logic
  Widget signupButtonCreateAccount({bool loader, Function onTap}) {
    return loader
        ? Center(child: CupertinoActivityIndicator())
        : RaisedButton(
            onPressed: onTap,
            color: AppColors.primaryColorPurple,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Container(
              width: 100.0,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: AppColors.primaryColorLight,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void validateForm(BuildContext ctx) async {
    if (ImageProviderSignup().isImage == null) {
      print("No image");
    } else {
      print("Image");
    }
    if (signupFormKey.currentState.validate()) {
      onceClicked = true;
      notifyListeners();
      signupFormKey.currentState.save();

      //Todo
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
        key: signupScaffoldKey,
        endPoint: EndPoints.userRegistration,
        afterRequest: () {},
        body: {
          "phone": MobileProvider.mobile.toString(),
          "password": signup.password,
          "email": signup.email,
          "name": signup.name,
          "state": signup.state,
          "city": signup.city,
        },
      );
      if (body["status"] == true) {
        onceFormValidated = false;
        onceClicked = false;

        notifyListeners();
        signupScaffoldKey.currentState.showSnackBar(
          StatusCodeCheck.snackBar(
              title: "You have successfully registered",
              backgroundColor: AppColors.green),
        );
        Future.delayed(Duration(milliseconds: 1300), () {
          // signupScaffoldKey.currentState.dispose();
          // // ignore: invalid_use_of_protected_member
          // signupFormKey.currentState.dispose();
          Navigator.pushReplacementNamed(ctx, "/LoginPage");
        });

        signupFormKey.currentState.reset();
        
        password.clear();
      } else {
        onceClicked = false;
        notifyListeners();
      }

      // onceFormValidated = false;
      // notifyListeners();
    }
  }

  void setOnceClicked() {
    onceClicked = true;
    notifyListeners();
  }

  void setOnceFormValidated() {
    onceFormValidated = true;
    notifyListeners();
  }

  String signupPageEmailValidation(String data) {
    if (data == "null") {
      return "Please Enter Email";
    } else if (data.trim() == null) {
      return "Please Enter Email";
    } else if (data.trim() == "") {
      return "Please Enter Email";
    } else if (!AppRegularExpression.emailRegExp
        .hasMatch(data.toString().trim())) {
      return "Please enter a valid Email";
    } else {
      return null;
    }
  }

  String signupPagePasswordValidation(String data) {
    if (data == "null") {
      return "Please Enter Password";
    } else if (data.trim() == null) {
      return "Please Enter Password";
    } else if (data.trim() == "") {
      return "Please Enter Password";
    } else {
      return null;
    }
  }

  String signupPageConfirmPasswordValidation(String data) {
    // print(confirmPassword.text);

    if (data == "null") {
      return "Please Enter Password";
    } else if (data.trim() == null) {
      return "Please Enter Password";
    } else if (data.trim() == "") {
      return "Please Enter Password";
    } else if (data != password.text) {
      return "Password Does not match";
    } else {
      return null;
    }
  }

  String signupPageNameValidation(String data) {
    if (data == "null") {
      return "Please Enter your Name";
    } else if (data.trim() == null) {
      return "Please Enter your Name";
    } else if (data.trim() == "") {
      return "Please Enter your Name";
    } else if (!AppRegularExpression.nameRegExp.hasMatch(data.toString())) {
      return "Please enter full Name";
    } else {
      return null;
    }
  }

  String signupPageStateCityValidation(String data) {
    if (data == "null") {
      return "Please Enter your State";
    } else if (data.trim() == null) {
      return "Please Enter your State";
    } else if (data.trim() == "") {
      return "Please Enter your State";
    } else {
      return null;
    }
  }
}

class ImageProviderSignup extends ChangeNotifier {
  File image;
  ImagePicker imagePicker;
  bool isImage;

  ImageProviderSignup() {
    imagePicker = ImagePicker();
  }
  Future getImage() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    image = File(pickedFile.path);
    isImage = true;
    notifyListeners();
  }
}

class PasswordStatusSignUp extends ChangeNotifier {
  bool showPassword;
  bool confirmShowPassword;

  PasswordStatusSignUp() {
    showPassword = false;
    confirmShowPassword = false;
  }

  void setStatusPassword() {
    this.showPassword = !showPassword;
    notifyListeners();
  }

  void setStateConfirmPassword() {
    this.confirmShowPassword = !confirmShowPassword;
    notifyListeners();
  }
}
