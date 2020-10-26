class AppRegularExpression {
  static RegExp nameRegExp = RegExp('[a-zA-Z]');
  static RegExp memberRegExp = RegExp('[0-9]');
  static RegExp searchPoolRegExp = RegExp('[a-zA-Z0-9]');
  static RegExp mobileRegExp = RegExp(
      '[0-9]{10}'); //TODO:Mobile number needs to be edited accordingly(country)
  static RegExp amountRegExp = RegExp('[0-9]');
  static RegExp socialRegExp = RegExp('[0-9]{4}');
  static RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}

class TextFieldValidation {
  static String nameValidation(String data) {
    if (data == "null") {
      return "Please Enter Name";
    } else if (data.trim() == null) {
      return "Please Enter Name";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (data.trim() == "") {
      return "Please Enter Name";
    } else if (!AppRegularExpression.nameRegExp.hasMatch(data.toString())) {
      return "Please enter Name";
    } else {
      return null;
    }
  }
  static String completeProfileNameValidation(String data) {
    if (data == "null") {
      return "Please Enter Name";
    } else if (data.trim() == null) {
      return "Please Enter Name";
    // } else if (data.contains(" ")) {
    //   return "Blank spaces not allowed";
    } else if (data.trim() == "") {
      return "Please Enter Name";
    } else if (!AppRegularExpression.nameRegExp.hasMatch(data.toString())) {
      return "Please enter Name";
    } else {
      return null;
    }
  }

  static String zipCode(String data) {
    if (data == "null") {
      return "Please Enter Zipcode";
    } else if (data.trim() == null) {
      return "Please Enter Zipcode";
    } else if (data.contains("-") || data.contains(",") || data.contains(".")) {
      return "Not valid";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (data.trim() == "") {
      return "Please Enter Zipcode";
    } else if (data.length != 5) {
      return "Enter valid zipcode";
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

  static String memberValidation(String data) {
    if (data == "null") {
      return "Please Enter Members";
    } else if (data.trim() == null) {
      return "Please Enter Members";
    } else if (data.trim() == "") {
      return "Please Enter Members";
    } else if (data.contains("-") || data.contains(",") || data.contains(".")) {
      return "Please Enter valid Members";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (int.parse(data) > 35 || int.parse(data) < 5) {
      return "Members can not be more than 35 or less than 5";
    } else if (!AppRegularExpression.memberRegExp.hasMatch(data.toString())) {
      return "Enter valid Members";
    }

    // else if (data[1] == "0" ) {
    //   return "Members can not 0";
    // }

    else {
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

  static String stateCityValidation(String data, String title) {
    if (data == "null") {
      return "Please Enter your $title";
    } else if (data.trim() == null) {
      return "Please Enter your $title";
    // } else if (data.contains(" ")) {
    //   return "Blank spaces not allowed";
    } else if (data.trim() == "") {
      return "Please Enter your $title";
    } else {
      return null;
    }
  }

  static String numberValidation(String data) {
    if (data == "null") {
      return "Please Enter months";
    } else if (data.trim() == null) {
      return "Please Enter valid months";
    } else if (data.contains("-") || data.contains(",") || data.contains(".")) {
      return "Please Enter valid months";
    } else if (data.contains(" ")) {
      return "Blank spaces not allowed";
    } else if (data.trim() == "") {
      return "Please Enter valid months";
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
    } else if (data.length != 10) {
      return "Mobile Number not valid";
    } else if (!AppRegularExpression.mobileRegExp
        .hasMatch(data.toString().trim())) {
      return "Mobile Number not valid";
    } else {
      return null;
    }
  }
}
