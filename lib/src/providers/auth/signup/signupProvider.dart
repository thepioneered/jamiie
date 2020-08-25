import 'package:Jamiie/src/widgets/loaderDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/pageModel.dart';
import '../../../utils/sharedPref.dart';
import '../../../utils/snackBar.dart';
import '../../../widgets/button/appButton.dart';
import '../../../models/signup.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../styles/colors.dart';

class SignupProvider extends ChangeNotifier {
  //Page Variables and keys
  GlobalKey<ScaffoldState> signupScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  Signup signup;
  PageModel pageModel;
  TextEditingController password;

  //Class Constructor
  SignupProvider() {
    password = TextEditingController();
    pageModel = PageModel();
    signup = Signup();
  }

  //Page Logic
  Widget signupButtonCreateAccount({bool loader, Function onTap}) {
    return AppButton.loginButton(
        loader: loader, onTap: onTap, title: "Sign Up");
  }

  void validateForm(BuildContext ctx) async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    // if (ImageProviderSignup().isImage == null) {
    //   print("No image");
    // } else {
    //   print("Image");
    // }
    if (signupFormKey.currentState.validate()) {
      signupFormKey.currentState.save();
      // pageModel.onceClicked = true;
      // notifyListeners();
      try {
        LoaderDialog.loaderDialog(signupScaffoldKey.currentContext);
      } catch (e) {
        print("Error At Logout Provider in Loader Dialog!");
        throw Exception(e);
      }
      print(signup.toJson(await LocalStorage.getMobile()));
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
        key: signupScaffoldKey,
        endPoint: EndPoints.userRegistration,
        afterRequest: () {},
        body: signup.toJson(await LocalStorage.getMobile()),
      );
      if (body["status"]) {
        Navigator.pop(signupScaffoldKey.currentContext);
        pageModel.onceFormSubmitted = false;
        pageModel.onceClicked = false;
        notifyListeners();
        signupFormKey.currentState.reset();
        password.clear();
        signupScaffoldKey.currentState.showSnackBar(
          AppSnackBar.snackBar(
              title: "You have successfully registered",
              backgroundColor: AppColors.green),
        );
        await LocalStorage.deleteData();
        Future.delayed(
          Duration(milliseconds: 1300),
          () {
            Navigator.pushNamedAndRemoveUntil(
                ctx, "/LoginPage", (route) => false);
          },
        );
      } else {
        pageModel.onceClicked = false;
        notifyListeners();
      }
    }
  }

  String signupPageConfirmPasswordValidation(String data) {
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
}

