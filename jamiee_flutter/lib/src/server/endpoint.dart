class EndPoints {
  static String toCheckInternet = "https://google.com";
  static String ipAddress = "https://gentle-crag-42252.herokuapp.com";
  static String sendOtp = "/api/phone";
  static String verifyOtp = "/api/phoneverification";
  static String userRegistration = "/api/register";
  static String userLogin = "/api/login";
  static Map<String,String> header = {"Content-Type": "application/json"};
}
