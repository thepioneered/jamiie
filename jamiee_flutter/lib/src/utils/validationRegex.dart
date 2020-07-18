import 'dart:async';

class AppRegularExpression {
  static RegExp nameRegExp = RegExp('[a-zA-Z]');
  static RegExp mobileRegExp = RegExp(
      '[0-9]{10}'); //TODO:Mobile number needs to be edited accordingly(conutry)
  static RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}

class AppValidations {
  // Name Validation:
  static final nameValidation = StreamTransformer<String, String>.fromHandlers(
    handleData: (_nameStream, sink) {
      if (_nameStream == "null") {
        sink.addError("Please Enter name");
      } else if (!AppRegularExpression.nameRegExp.hasMatch(_nameStream)) {
        sink.addError("RegExp not full-filled name");
      } else {
        sink.add(_nameStream);
      }
    },
  );

  //Email Validation:
  static final emailValidation = StreamTransformer<String, String>.fromHandlers(
    handleData: (_emailStream, sink) {
      if (_emailStream == "null") {
        sink.addError("Please Enter Email");
      } else if (!AppRegularExpression.emailRegExp.hasMatch(_emailStream)) {
        sink.addError("RegExp not full-filled email");
      } else {
        sink.add(_emailStream);
      }
    },
  );

  //Password Validation
  static final passwordValidation =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (_passwordStream, sink) {
      if (_passwordStream == "null") {
        sink.addError("Please Enter Password");
      } else if (_passwordStream.length < 10) {
        sink.addError("RegExp not full-filled passwor");
      } else {
        sink.add(_passwordStream);
      }
    },
  );

  //Mobile validation
  static final mobileValidation =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (_mobileStream, sink) {
      if (_mobileStream == "null") {
        sink.addError("Please Enter Mobile No.");
      } else if (!AppRegularExpression.mobileRegExp.hasMatch(_mobileStream) &&
          _mobileStream.length != 10) {
        sink.addError("RegExp not full-filled mobile");
      } else {
        sink.add(_mobileStream);
      }
    },
  );
}
