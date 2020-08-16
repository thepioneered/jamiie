import 'package:Jamiie/src/models/pageModel.dart';
import 'package:flutter/material.dart';
import '../../models/createPoolModel.dart';

class CreatePoolProvider with ChangeNotifier {
  final createPoolFormKey = GlobalKey<FormState>();
  final createPoolScaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate;

  CreatePoolModel createPool;
  PageModel pageModel;
  // bool onceClicked;
  // bool onceFormValidated;
  bool onceDatePickerClicked;
  double start;
  double end;
  bool dateHasError;

  CreatePoolProvider() {
    start = 5.0;
    end = 10.0;
    createPool = CreatePoolModel();
    selectedDate = DateTime(0);
    dateHasError = false;
    pageModel = PageModel();
    // onceClicked = false;
    // onceFormValidated = false;
    onceDatePickerClicked = false;
  }

  @override
  void dispose() {
    super.dispose();
    onceDatePickerClicked = false;
    print("DIPOSED");
  }

  void setRangeSlider(double _start, double _end) {
    start = _start;
    end = _end;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      onceDatePickerClicked = true;
      notifyListeners();
    }
  }

  void createPoolLogic() {
    // print(selectedDate.toIso8601String()[0]);
    // print(selectedDate);
    // onceFormValidated = true;
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (createPoolFormKey.currentState.validate() &&
        selectedDate.toIso8601String()[0] != '0') {
      createPoolFormKey.currentState.save();
      if (dateHasError == true) {
        dateHasError = false;
        notifyListeners();
      }
      print(createPool.poolName);
      print(createPool.amount);
      print(selectedDate);
      print(createPool.poolType);
    } else {
      if (selectedDate.toIso8601String()[0] != '0') {
        dateHasError = false;
        notifyListeners();
      } else {
        dateHasError = true;
        notifyListeners();
      }
    }
  }
}
