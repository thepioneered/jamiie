class AppRegularExpression {
  static RegExp nameRegExp = RegExp('[a-zA-Z]');
  static RegExp searchPoolRegExp = RegExp('[a-zA-Z0-9]');
  static RegExp mobileRegExp = RegExp(
      '[0-9]{10}'); //TODO:Mobile number needs to be edited accordingly(conutry)
  static RegExp amountRegExp = RegExp(
      '[0-9]'); //TODO:Mobile number needs to be edited accordingly(conutry)
  static RegExp socialRegExp = RegExp(
      '[0-9]{9}'); //TODO:Mobile number needs to be edited accordingly(conutry)
  static RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}

class TextFieldValidation {
  static String nameValidation(String data) {
    if (data == "null") {
      return "Please Enter your Name";
    } else if (data.trim() == null) {
      return "Please Enter your Name";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (data.trim() == "") {
      return "Please Enter your Name";
    } else if (!AppRegularExpression.nameRegExp.hasMatch(data.toString())) {
      return "Please enter full Name";
    } else {
      return null;
    }
  }

  static String searchPoolValidation(String data) {
    if (data == "null") {
      return "Please Enter Pool Id";
    } else if (data.trim() == null) {
      return "Please Enter Pool Id";
    } else if (data.trim() == "") {
      return "Please Enter Pool Id";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (data.trim().length != 8) {
      return "Please Enter valid Pool Id";
    } else if (!AppRegularExpression.searchPoolRegExp
        .hasMatch(data.toString())) {
      return "Please Enter valid Pool Id";
    } else {
      return null;
    }
  }

  static String amountValidation(String data) {
    print(data.contains("-"));
    if (data == "null") {
      return "Please Enter Amount";
    } else if (data.trim() == null) {
      return "Please Enter Amount";
    } else if (data.trim() == "") {
      return "Please Enter Amount";
    } else if (data.contains("-") || data.contains(",") || data.contains(".")) {
      return "Please Enter valid Amount";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (data.length > 5) {
      return "Amount can not exceed \$ 99999";
    } else if (!AppRegularExpression.amountRegExp.hasMatch(data.toString())) {
      return "Please enter Amount";
    } else {
      return null;
    }
  }

  static String socialNumber(String data) {
    if (data == "null") {
      return "Please Enter Social Security number";
    } else if (data.trim() == null) {
      return "Please Enter Social Security number";
    } else if (data.trim() == "") {
      return "Please Enter Social Security number";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (!AppRegularExpression.socialRegExp.hasMatch(data.toString())) {
      return "Please Enter a valid Social Security number";
    } else {
      return null;
    }
  }

  static String passwordValidation(String data) {
    if (data == "null") {
      return "Please Enter Password";
    } else if (data.trim() == null) {
      return "Please Enter Password";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (data.trim() == "") {
      return "Please Enter Password";
    } else {
      return null;
    }
  }

  static String emailValidation(String data) {
    if (data == "null") {
      return "Please Enter Email";
    } else if (data.trim() == null) {
      return "Please Enter Email";
    } else if (data.trim() == "") {
      return "Please Enter Email";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (!AppRegularExpression.emailRegExp
        .hasMatch(data.toString().trim())) {
      return "Please enter a valid Email";
    } else {
      return null;
    }
  }

  static String stateCityValidation(String data) {
    if (data == "null") {
      return "Please Enter your State";
    } else if (data.trim() == null) {
      return "Please Enter your State";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (data.trim() == "") {
      return "Please Enter your State";
    } else {
      return null;
    }
  }

  static String mobileValidation(String data) {
    if (data == "null") {
      return "Please Enter Mobile Number";
    } else if (data.trim() == null) {
      return "Please Enter Mobile Number";
    } else if (data.trim() == "") {
      return "Please Enter Mobile Number";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (!AppRegularExpression.mobileRegExp
        .hasMatch(data.toString().trim())) {
      return "Please enter a valid Mobile Number";
    } else {
      return null;
    }
  }
}
