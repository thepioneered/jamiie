class AppConstString {
  static String sharePoolId(String _id) {
    return "Hi there,\nLet's save money together!\nJoin my pool in the JAMIIE app: Play store link will come here.\n\nAfter completing your login join my pool with the following id: $_id";
  }

  static String get sharePooltitle => "Share";
}

class SignUpFlowText {
  static String get otpPageTitle => "Enter Authorization Code";
  static String get otpPageSubTitle =>
      "Please enter authorization code sent to your mobile number.";
  static String get otpPageButton => "Verify";
  static String get mobilePageTitle => "Create Account";
  static String get mobilePageSubTitle =>
      "Please enter your mobile number for verification.";
  static String get mobilePageButton => "Send Authorization Code";
}
class ForgotPasswordFlowText {
  static String get otpPageTitle => "Enter Authorization Code";
  static String get otpPageSubTitle =>
      "Please enter authorization code sent to your mobile number.";
  static String get otpPageButton => "Verify";
  static String get mobilePageTitle => "Forgot Password?";
  static String get mobilePageSubTitle =>
      "Enter your mobile number to reset your password.";
  static String get mobilePageButton => "Send Authorization Code";
}
