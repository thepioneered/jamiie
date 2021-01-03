class EndPoints {
  //All Endpoint and IP address
  static const String ipAddress = "https://jamiie.anukai.com";
  static const String sendOtp = "/userauth/phone";
  static const String verifyOtp = "/userauth/phoneverification";
  static const String resendOtp = "/userauth/resendotp";
  static const String userRegistration = "/userauth/register";
  static const String userLogin = "/userauth/login";
  static const String userlogout = "/userauth/logout";
  static const String forgotPassword = "/userauth/forgotpassword";
  static const String riskScore = "/userauth/riskscore";
  static const String createPool = "/pool/createpool";
  static const String joinPool = "/pool/joinpool";
  static const String searchPool = "/pool/searchpool";
  static const String completeProfile = "/userauth/completeprofile";
  static const String createdPoolsList = "/pool/createpooldetail/";
  static const String completePoolData = "/pool/singlepool/";
  static const String startPool = "/pool/startpool";
  static const String dashboard = "/pool/dashboard/";
  static const String joinedPoolList = "/pool/userjoinedpool/";
  static const String paymentTransafer = "/payments/transfer";
  static const String bankVerification = "/payments/bankverification";
  static const String paidUserDetail = "/payments/paiddetail";
  static const String poolAmount = "/payments/amount";
  static const String notPaidUserDetail = "/payments/notpaiddetail";
  static const String loanDetail = "/payments/loandetail";
  static const String adminPaidUserDetail = "/payments/adminpaidusers";
  static const String adminNotPaidUserDetail = "/payments/adminnotpaidusers";
  static const String bankPageWebView = "/payments/bank/";
  static const String payButtonLogic = "/payments/paybutton";
  static const String confirmLoan = "/payments/loan";

  static String webviewLink(String mobile) {
    return EndPoints.ipAddress +
        EndPoints.bankPageWebView +
        mobile.substring(1, mobile.length);
  }

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
