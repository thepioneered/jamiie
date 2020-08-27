class LoginResponse {
  bool profileCompleted;
  bool riskCalculated;
  String token;

  LoginResponse.fromJson(Map<String, dynamic> json)
      : profileCompleted = json["completeProfile"],
        riskCalculated = json["riskCalculator"],
        token = json["token"];
}
