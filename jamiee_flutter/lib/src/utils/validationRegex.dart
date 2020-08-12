class AppRegularExpression {
  static RegExp nameRegExp = RegExp('[a-zA-Z]');
  static RegExp mobileRegExp = RegExp(
      '[0-9]{10}'); //TODO:Mobile number needs to be edited accordingly(conutry)
  static RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}

class TextFieldValidation {
  static String passwordValidation(String data) {
    if (data == "null") {
      return "Please Enter Password";
    } else if (data.trim() == null) {
      return "Please Enter Password";
    } else if (data.trim() == "") {
      return "Please Enter Password";
    } else {
      return null;
    }
  }
}
