import '../../../widgets/loaderDialog.dart';
import 'package:flutter/material.dart';
import '../../../models/auth/newPasswordModel.dart';
import '../../../models/base/pageModel.dart';
import '../../../utils/sharedPref.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../styles/colors.dart';
import '../../../utils/snackBar.dart';
import '../../../widgets/button/appButton.dart';

class NewPasswordProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> newpassScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> newpassFormKey = GlobalKey<FormState>();
  final password = TextEditingController();
  PageModel pageModel;
  NewPasswordModel newPasswordModel;

  NewPasswordProvider() {
    pageModel = PageModel();
    newPasswordModel = NewPasswordModel();
  }

  Widget updatePasswordButton( Function onTap) {
    return AppButton.loginButton(
        onTap: onTap, title: "Update Password");
  }

  void updateNewPassword() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (newpassFormKey.currentState.validate()) {
      newpassFormKey.currentState.save();
      String a = await LocalStorage.getMobile();
      a = a.substring(1, a.length);
      try {
        LoaderDialog.loaderDialog(newpassScaffoldKey.currentContext);
      } catch (e) {
        print("Error At Logout Provider in Loader Dialog!");
        throw Exception(e);
      }
      Map<String, dynamic> body = await NetworkCalls.putDataToServer(
        shouldPagePop: true,
        key: newpassScaffoldKey,
        endPoint: EndPoints.setNewPassword(a),
        body: newPasswordModel,
      );

      if (body["status"]) {
        pageModel.onceFormSubmitted = false;
        newpassFormKey.currentState.reset();
        password.clear();
        await LocalStorage.deleteData();
        notifyListeners();
        Navigator.pop(newpassScaffoldKey.currentContext);
        Future.delayed(Duration(milliseconds: 1300), () {
          Navigator.pushNamedAndRemoveUntil(newpassScaffoldKey.currentContext,
              "/LoginPage", (route) => false);
        });
        newpassScaffoldKey.currentState.showSnackBar(
          AppSnackBar.snackBar(
            title: "Password Changed.",
            backgroundColor: AppColors.green,
          ),
        );
      } else {
        newpassScaffoldKey.currentState.showSnackBar(
          AppSnackBar.snackBar(
            title: "Password Not Changed.",
            backgroundColor: AppColors.red,
          ),
        );
      }
    }
  }

  String confirmPasswordValidation(String data) {
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
