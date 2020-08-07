import 'dart:convert';

import 'package:crypto/crypto.dart';

class Signup {
  String name;
  String email;
  // String mobile;
  String password;
  // String confirmPassword;
  String city;
  String state;

  Signup(
      {this.name,
      this.email,
      // this.mobile,
      // this.confirmPassword,
      this.password,
      this.city,
      this.state});

  void setPassword(String _password) {
    this.password = sha256.convert(utf8.encode(_password)).toString();
  }
}
