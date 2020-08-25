import 'dart:convert';
import 'package:crypto/crypto.dart';

class Signup {
  String firstName;
  String lastName;
  String email;
  String password;

  Signup(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,});

  void setPassword(String _password) {
    this.password = sha256.convert(utf8.encode(_password)).toString();
  }

  Map<String, dynamic> toJson(String _mobile) => {
        "phone": _mobile,
        "password": password,
        "email": email,
        "name": '$firstName $lastName',
      };
}
