import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

// class FaqData {
//   Map<String, dynamic> _map;
//   final _faqDataController = StreamController<Map<String, dynamic>>();

//   Stream<Map<String, dynamic>> get faqData => _faqDataController.stream;

// void getData() async {
//   http.get("https://jsonplaceholder.typicode.com/posts").then((value) {
//     var q = jsonDecode(value.body);

//     _map = q[0];
//     print(_map);
//     _faqDataController.sink.add(_map);
//     _faqDataController.done;
//     // value.body,
//   });
// }

//   void dispose() {
//     if (!_faqDataController.isClosed) _faqDataController.close();
//   }
// }

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
    var value =
        await http.get("https://jsonplaceholder.typicode.com/posts", headers: {
      "Content-Type": "application/json",
    });
    var q = jsonDecode(value.body);
    print(q);
    _faqMap = q;

    isDataLoaded = true;
    notifyListeners();
  }
}
