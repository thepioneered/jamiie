import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class FaqData with ChangeNotifier {
  List _faqMap;
  bool isDataLoaded;

  FaqData() {
    isDataLoaded = false;
    getData();
  }

  bool checkDataLoading() {
    return this.isDataLoaded;
  }

  List faqData() {
    return this._faqMap;
  }

  void getData() async {
    try {
      var value = await http
          .get("https://jsonplaceholder.typicode.com/posts", headers: {
        "Content-Type": "application/json",
      });
      _faqMap = jsonDecode(value.body);

      isDataLoaded = true;
      notifyListeners();
    } catch (e) {
      print("Error : $e");
    }
  }
}
