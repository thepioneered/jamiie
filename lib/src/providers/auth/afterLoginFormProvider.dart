import 'package:Jamiie/src/models/base/pageModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
import 'package:flutter/material.dart';
import '../../models/auth/afterLoginform.dart';

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
    //todo
    // autoValidate = true;
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(
        listModel.toJson(
          await LocalStorage.getMobile(),
        ),
      );
      //   // pageModel.onceClicked = true;
      //   // notifyListeners();
      try {
        LoaderDialog.loaderDialog(scaffoldKey.currentContext);
      } catch (e) {
        print("Error At Logout Provider in Loader Dialog!");
        throw Exception(e);
      }
      //   listModel.mobile = await LocalStorage.getMobile();

      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
        key: scaffoldKey,
        endPoint: EndPoints.riskScore,
        afterRequest: () {},
        authRequest: true,
        body: listModel.toJson(await LocalStorage.getMobile()),
      );

      if (body["status"]) {
        print("Data Posted");
        pageModel.onceFormSubmitted = false;
        notifyListeners();
        formKey.currentState.reset();
        Navigator.pop(scaffoldKey.currentContext);
        await LocalStorage.setisRiskCalculated();
        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.pushReplacementNamed(scaffoldKey.currentContext, "/NavBar");
        });
      }
    }
  }
}
