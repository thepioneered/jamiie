import 'package:Jamiie/src/models/mobileModel.dart';
import '../../../models/pageModel.dart';
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

  Widget sendOtpButton({@required Function onTap, @required bool loader}) {
    return AppButton.loginButton(
      loader: loader,
      onTap: onTap,
      title: "Send OTP",
    );
  }

  void mobileNumberCheck() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (mobileFormKey.currentState.validate()) {
      mobileFormKey.currentState.save();
      pageModel.onceClicked = true;
      notifyListeners();
      print(mobileModel.mobile);
      print(mobileModel.toJson());
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: mobileScaffoldKey,
          endPoint: EndPoints.sendOtp,
          afterRequest: () {},
          body: mobileModel.toJson());

      if (body["status"]) {
        await LocalStorage.setMobile(mobileModel.mobile);
        pageModel.onceClicked = false;
        pageModel.onceFormSubmitted = false;
        notifyListeners();
        mobileFormKey.currentState.reset();
        Navigator.pushReplacementNamed(
            mobileScaffoldKey.currentContext, "/OtpPage");
      } else {
        pageModel.onceClicked = false;
        notifyListeners();
      }
    }
  }
}
