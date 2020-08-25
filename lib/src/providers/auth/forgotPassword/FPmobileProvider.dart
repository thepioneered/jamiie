import 'package:Jamiie/src/repositry/textConst.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
import 'package:flutter/material.dart';
import '../../../models/mobileModel.dart';
import '../../../models/pageModel.dart';
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

  Widget sendOtpButton({@required Function onTap, @required bool loader}) {
    return AppButton.loginButton(
      loader: loader,
      onTap: onTap,
      title: ForgotPasswordFlowText.mobilePageButton,
    );
  }

  void forgotPassword() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (forgotPasswordFormKey.currentState.validate()) {
      forgotPasswordFormKey.currentState.save();
      // pageModel.onceClicked = true;
      // notifyListeners();
      print(mobileModel.mobile);
      print(mobileModel.toJson());
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
        pageModel.onceClicked = false;
        pageModel.onceFormSubmitted = false;
        notifyListeners();
        Navigator.pop(forgotPasswordScaffoldKey.currentContext);
        forgotPasswordFormKey.currentState.reset();
        Navigator.pushReplacementNamed(
            forgotPasswordScaffoldKey.currentContext, "/FPOtpPage");
      } else {
        pageModel.onceClicked = false;
        notifyListeners();
      }
    }
  }
}
