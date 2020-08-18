class EndPoints {
  //All Endpoint and IP address
  static const String ipAddress = "https://jamiieapi.herokuapp.com";
  static const String sendOtp = "/api/phone";
  static const String verifyOtp = "/api/phoneverification";
  static const String userRegistration = "/api/register";
  static const String userLogin = "/api/login";
  static const String userlogout = "/api/logout";
  static const String forgotPassword = "/api/forgotpassword";
  static const String riskScore = "/api/riskscore";
  static const String createPool = "/pool/createpool";
  static const String joinPool = "/pool/joinpool";
  static const String searchPool = "/pool/searchpool";

  //End point for new password put request
  static String setNewPassword(String _mobile) {
    return '$forgotPassword/$_mobile/';
  }

  //Header: Without Token
  static const Map<String, String> header = {
    "Content-Type": "application/json"
  };

  //Header: With Token as argument
  static Map<String, String> authHeader(String _token) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Token $_token",
    };
  }
}
