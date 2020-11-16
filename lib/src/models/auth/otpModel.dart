class OtpModel {
  String otp;

  OtpModel({this.otp});

  Map<String, dynamic> toJson(String _mobile) => {
        "phone": _mobile,
        "otp": otp,
      };
}

class ResendOtpModel {
  // final String mobile;

  // ResendOtpModel({this.mobile});
  Map<String, dynamic> toJson(final String _mobile) => {
        "phone": _mobile,
      };
}
