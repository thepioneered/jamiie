import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/models/afterLoginform.dart';

class FormProvider extends ChangeNotifier{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AfterLoginForm listModel = AfterLoginForm();

  void callListners() {
    notifyListeners();
  }

  void onPressed() {
    print(listModel.data1);
    print(listModel.data2);
    print(listModel.data3);
    print(listModel.data4);
    print(listModel.data5);
    print(listModel.data6);
    print(listModel.data7);
  }
}
