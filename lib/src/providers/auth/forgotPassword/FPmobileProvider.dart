import '../../../repositry/textConst.dart';
import '../../../widgets/loaderDialog.dart';
import 'package:flutter/material.dart';
import '../../../models/auth/mobileModel.dart';
import '../../../models/base/pageModel.dart';
import '../../../utils/sharedPref.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';
import '../../../widgets/button/appButton.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  PageModel pageModel;
  GlobalKey<ScaffoldState> forgotPasswordScaffoldKey =
      GlobalKey<ScaffoldState>();

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  MobileModel mobileModel;

  ForgotPasswordProvider() {
    pageModel = PageModel();
    mobileModel = MobileModel();
  }

  Widget sendOtpButton({@required Function onTap}) {
    return AppButton.loginButton(
      
      onTap: onTap,
      title: ForgotPasswordFlowText.mobilePageButton,
    );
  }

  void forgotPassword() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (forgotPasswordFormKey.currentState.validate()) {
      forgotPasswordFormKey.currentState.save();
      try {
        LoaderDialog.loaderDialog(forgotPasswordScaffoldKey.currentContext);
      } catch (e) {
        print("Error At Logout Provider in Loader Dialog!");
        throw Exception(e);
      }
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: forgotPasswordScaffoldKey,
          endPoint: EndPoints.forgotPassword,
          afterRequest: () {},
          body: mobileModel.toJson());

      if (body["status"]) {
        await LocalStorage.setMobile(mobileModel.mobile);
        pageModel.onceFormSubmitted = false;
        notifyListeners();
        forgotPasswordFormKey.currentState.reset();
        Navigator.pop(forgotPasswordScaffoldKey.currentContext);
        Navigator.pushReplacementNamed(
            forgotPasswordScaffoldKey.currentContext, "/FPOtpPage");
      }
    }
  }
}
