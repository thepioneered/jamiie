import 'package:flutter/material.dart';

class PasswordStatus extends ChangeNotifier {
  bool statusLogin = true;
  bool statusSignupPassword = true;
  bool statusConfirmPassword = true;

  void setStatusLogin() {
    statusLogin = !statusLogin;
    notifyListeners();
  }

  bool getStatusLogin() {
    return this.statusLogin;
  }

  void setStatusSignupPassword() {
    statusSignupPassword = !statusSignupPassword;
    notifyListeners();
  }

  bool getStatusSignupPassword() {
    return this.statusSignupPassword;
  }

  void setStatusConfirmPassword() {
    statusConfirmPassword = !statusConfirmPassword;
    notifyListeners();
  }

  bool getStatusConfirmPassword() {
    return this.statusConfirmPassword;
  }
}
