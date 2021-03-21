class MobileModel {
  String mobile;
  MobileModel({this.mobile});

  void setMobile(String _mobile) {
    //TODO:+91 edit required here
    //TODO:+1 edit required here
    mobile = '+1$_mobile';
  }

  Map<String, dynamic> toJson() => {"phone": mobile};
}
