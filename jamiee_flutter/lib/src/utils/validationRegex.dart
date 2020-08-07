class AppRegularExpression {
  static RegExp nameRegExp = RegExp('[a-zA-Z]');
  static RegExp mobileRegExp = RegExp(
      '[0-9]{10}'); //TODO:Mobile number needs to be edited accordingly(conutry)
  static RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
