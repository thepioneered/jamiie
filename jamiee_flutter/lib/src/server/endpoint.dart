class EndPoints {
  static const String ipAddress = "https://jamiieapi.herokuapp.com";
  static const String sendOtp = "/api/phone";
  static const String verifyOtp = "/api/phoneverification";
  static const String userRegistration = "/api/register";
  static const String userLogin = "/api/login";
  static const String userlogout = "/api/logout";
  static const String forgotPassword = "/api/forgotpassword";

  //Header
  static const Map<String, String> header = {"Content-Type": "application/json"};
}
