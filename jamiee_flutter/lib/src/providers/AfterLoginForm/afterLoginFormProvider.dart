import 'package:Jamiie/src/models/pageModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/utils/snackBar.dart';
import 'package:flutter/material.dart';
import '../../models/afterLoginform.dart';

class AfterLoginFormProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AfterLoginFormModel listModel = AfterLoginFormModel();
  // bool autoValidate;
  PageModel pageModel;

  AfterLoginFormProvider() {
    // autoValidate = false;
    pageModel = PageModel();
  }

  void callListners() {
    notifyListeners();
  }

  String validator(String value) {
    if (value == null) {
      return "Please select an option!";
    } else {
      return null;
    }
  }

  void onPressed() async {
    // autoValidate = true;
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      pageModel.onceClicked = true;
      notifyListeners();
      listModel.mobile = await LocalStorage.getMobile();
      print(listModel.toJson());

      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
        key: scaffoldKey,
        endPoint: EndPoints.riskScore,
        afterRequest: () {},
        authRequest: true,
        body: listModel.toJson(),
      );

      if (body["status"]) {
        print("Data Posted");
        pageModel.onceClicked = false;
        pageModel.onceFormSubmitted = false;
        notifyListeners();
        formKey.currentState.reset();
        await LocalStorage.setFirstLogin();
        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.pushReplacementNamed(scaffoldKey.currentContext, "/NavBar");
        });
      } else {
        print("Data Not posted");
      }
    }
  }
}
