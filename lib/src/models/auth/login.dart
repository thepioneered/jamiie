class Login {
  String mobile;
  String password;
  String mobileToken;
  Login({this.mobile, this.password, this.mobileToken});

  void setMobile(String _mobile) {
    //TODO: +91 edit is required here
    mobile = '+91$_mobile';
  }

  Map<String, dynamic> toJson() =>
      {"phone": mobile, "password": "$password", "mobileId": mobileToken};
}
