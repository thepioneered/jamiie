class LoginResponse {
  bool profileCompleted;
  bool riskCalculated;
  String token;
  // bool bankAdded

  LoginResponse.fromJson(Map<String, dynamic> json)
      : profileCompleted = json["completeProfile"],
        riskCalculated = json["riskCalculator"],
        token = json["token"];
}

class SocialLoginResponse {
  bool firstLogin; // If false logged in earlier else if true done before
  bool profileCompleted;
  bool riskCalculated;
  String token;
  String mobile;

  SocialLoginResponse.fromJson(Map<String, dynamic> json)
      : firstLogin = json["firstLogin"],
        profileCompleted = json["completeProfile"],
        riskCalculated = json["riskCalculator"],
        token = json["token"],
        mobile = json["phone"];
}
