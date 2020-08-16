import 'package:crypto/crypto.dart';
import 'dart:convert';

class NewPasswordModel {
  String password;
  void setPassword(String _password) {
    this.password = sha256.convert(utf8.encode(_password)).toString();
  }

  Map<String, dynamic> toJson() => {
        "password": password,
      };
}
