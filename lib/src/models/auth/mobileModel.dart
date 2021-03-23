class MobileModel {
  String mobile;
  MobileModel({this.mobile});

  void setMobile(String _mobile) {
    //TODO:+1 or +91 edit required here
    mobile = '+91$_mobile';
  }

  Map<String, dynamic> toJson() => {"phone": mobile};
}
