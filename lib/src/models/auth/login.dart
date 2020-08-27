
class Login {
  String mobile;
  String password;
  Login({this.mobile, this.password});


  void setMobile(String _mobile) {
    //TODO: +91 edit is required here
    mobile = '+91$_mobile';
  }

  Map<String, dynamic> toJson() => {
        "phone": mobile,
        "password": "$password",
      };
}
