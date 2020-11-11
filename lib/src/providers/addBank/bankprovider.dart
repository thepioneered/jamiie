import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';

class BankProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String url;

  Future<Null> loadPage() async {
    String mobile = await LocalStorage.getMobile();
    mobile = mobile.substring(1, mobile.length);
    url = 'https://jamiie.anukai.com/payments/bank/' + mobile;
  }
}
