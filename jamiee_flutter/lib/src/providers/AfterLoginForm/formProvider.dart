import 'package:flutter/material.dart';
import '../../models/afterLoginform.dart';

class FormProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AfterLoginForm listModel = AfterLoginForm();
  bool autoValidate;

  FormProvider() {
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

  void onPressed() {
    autoValidate = true;
    notifyListeners();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      autoValidate = false;
      notifyListeners();
      print(listModel.data1);
      print(listModel.data2);
      print(listModel.data3);
      print(listModel.data4);
      print(listModel.data5);
      print(listModel.data6);
      print(listModel.data7);
    }
  }
}