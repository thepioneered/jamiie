class OtpModel {
  String otp;

  OtpModel({this.otp});

  Map<String, dynamic> toJson(String _mobile) => {
        "phone": _mobile,
        "otp": otp,
      };
}
