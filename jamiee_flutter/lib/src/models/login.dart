import 'package:crypto/crypto.dart';
import 'dart:convert';

class Login {
  String mobile;
  String password;
  Login({this.mobile, this.password});

  void setPassword(String _password) {
    this.password = sha256.convert(utf8.encode(_password)).toString();
  }

  Map<String, dynamic> toJson() => {
        "phone": "+91$mobile",
        "password": "$password",
      };
}
