import 'package:flutter/material.dart';
import '../../../models/newPasswordModel.dart';
import '../../../models/pageModel.dart';
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

  Widget updatePasswordButton(bool loader, Function onTap) {
    return AppButton.loginButton(
        loader: loader, onTap: onTap, title: "Update Password");
  }

  void updateNewPassword() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (newpassFormKey.currentState.validate()) {
      pageModel.onceClicked = true;
      notifyListeners();
      newpassFormKey.currentState.save();
      String a = await LocalStorage.getMobile();
      a = a.substring(1, a.length);
      print(EndPoints.ipAddress + EndPoints.setNewPassword(a));
      Map<String, dynamic> body = await NetworkCalls.putDataToServer(
        key: newpassScaffoldKey,
        endPoint: EndPoints.setNewPassword(a),
        body: newPasswordModel,
      );

      if (body["status"]) {
        pageModel.onceClicked = false;
        pageModel.onceFormSubmitted = false;
        password.clear();
        await LocalStorage.deleteData();
        notifyListeners();
        newpassFormKey.currentState.reset();
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
        pageModel.onceClicked = false;
        notifyListeners();
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
