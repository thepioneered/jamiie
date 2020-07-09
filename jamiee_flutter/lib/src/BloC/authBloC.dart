import 'dart:async';

import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _mobile = BehaviorSubject<String>();

  //Getters
  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);
  Stream<String> get mobileStream => _mobile.stream.transform(validateMobile);
  // Stream<bool> get isValidLogin => CombineLatestStream.combine2(
  //     emailStream, passwordStream, (emailSttream, passwordStream) => true);

  Stream<bool> get isSignupValid1 => CombineLatestStream.combine2(
      emailStream, mobileStream, (emailStream, mobileStream) => true);

  //Setters

  Function(String) get emailSink => _email.sink.add;
  Function(String) get passwordSink => _password.sink.add;
  Function(String) get mobileSink => _mobile.sink.add;

  dispose() {
    _email.close();
    _password.close();
    _mobile.close();
  }

  //Transformers

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (emailStream, sink) {
    if (emailStream.length < 10) {
      print(emailStream);
      sink.addError("Email wrong");
    } else {
      sink.add(emailStream);
    }
  });

  final validateMobile = StreamTransformer<String, String>.fromHandlers(
      handleData: (mobileStream, sink) {
    if (mobileStream.length != 10) {
      sink.addError("Wrong Mobile");
    } else {
      sink.add(mobileStream);
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (passwordStream, sink) {
    if (passwordStream.length < 10 || passwordStream.contains(" ")) {
      sink.addError("Password wrong");
    } else {
      sink.add(passwordStream);
    }
  });
}
