import '../../../models/auth/mobileModel.dart';
import '../../../repositry/textConst.dart';
import '../../../widgets/loaderDialog.dart';
import '../../../models/base/pageModel.dart';
import '../../../utils/sharedPref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/button/appButton.dart';
import '../../../server/endpoint.dart';
import '../../../server/networkCalls.dart';

class MobileProvider extends ChangeNotifier {
  PageModel pageModel;
  GlobalKey<ScaffoldState> mobileScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> mobileFormKey = GlobalKey<FormState>();
  MobileModel mobileModel;

  MobileProvider() {
    pageModel = PageModel();
    mobileModel = MobileModel();
  }

  Widget sendOtpButton({@required Function onTap}) {
    return AppButton.loginButton(
      onTap: onTap,
      title: SignUpFlowText.mobilePageButton,
    );
  }

  void mobileNumberCheck() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (mobileFormKey.currentState.validate()) {
      mobileFormKey.currentState.save();
      try {
        LoaderDialog.loaderDialog(mobileScaffoldKey.currentContext);
      } catch (e) {
        print("Error At Logout Provider in Loader Dialog!");
        throw Exception(e);
      }
      
      
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: mobileScaffoldKey,
          shouldPagePop: true,
          endPoint: EndPoints.sendOtp,
          afterRequest: () {},
          body: mobileModel.toJson());

      if (body["status"]) {
        Navigator.pop(mobileScaffoldKey.currentContext);
        await LocalStorage.setMobile(mobileModel.mobile);
        pageModel.onceFormSubmitted = false;
        notifyListeners();
        mobileFormKey.currentState.reset();
        Navigator.pushReplacementNamed(
            mobileScaffoldKey.currentContext, "/OtpPage");
      } 
    }
  }
}
