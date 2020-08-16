import 'dart:convert';

import 'package:crypto/crypto.dart';

class Signup {
  String name;
  String email;
  String password;
  String city;
  String state;

  Signup({this.name, this.email, this.password, this.city, this.state});

  void setPassword(String _password) {
    this.password = sha256.convert(utf8.encode(_password)).toString();
  }

  Map<String, dynamic> toJson(String _mobile) => {
        "phone": _mobile,
        "password": password,
        "email": email,
        "name": name,
        "state": state,
        "city": city,
      };
}
