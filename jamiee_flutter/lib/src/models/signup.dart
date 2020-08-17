import 'dart:convert';
import 'package:crypto/crypto.dart';

class Signup {
  String firstName;
  String lastName;
  String email;
  String password;
  String city;
  String state;
  String socialNumber;

  Signup(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.city,
      this.state,
      this.socialNumber});

  void setPassword(String _password) {
    this.password = sha256.convert(utf8.encode(_password)).toString();
  }

  Map<String, dynamic> toJson(String _mobile) => {
        "phone": _mobile,
        "password": password,
        "email": email,
        "name": '$firstName $lastName',
        "state": state,
        "city": city,
        "securityno": socialNumber
      };
}
