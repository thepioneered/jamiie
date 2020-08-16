import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import '../../models/afterLoginform.dart';

class AfterLoginFormProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AfterLoginFormModel listModel = AfterLoginFormModel();
  bool autoValidate;

  AfterLoginFormProvider() {
    autoValidate = false;
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
    autoValidate = true;
    notifyListeners();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      autoValidate = false;
      notifyListeners();
      listModel.mobile = await LocalStorage.getMobile();
      print(listModel.toJson());

      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
        key: scaffoldKey,
        endPoint: EndPoints.riskScore,
        afterRequest: () {},
        body: listModel.toJson(),
      );

      if (body["status"]) {
        print("Data Posted");
      } else {}
    }
  }
}
