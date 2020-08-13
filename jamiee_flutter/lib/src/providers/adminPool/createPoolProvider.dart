import 'package:flutter/material.dart';

class CreatePoolProvider with ChangeNotifier {
  final createPoolFormKey = GlobalKey<FormState>();
  final createPoolScaffoldKey = GlobalKey<ScaffoldState>();

  double start;
  double end;

  CreatePoolProvider() {
    start = 5.0;
    end = 10.0;
  }

  void setRangeSlider(double _start, double _end) {
    start = _start;
    end = _end;
    notifyListeners();
  }
}
