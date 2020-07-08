import 'dart:async';

import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Getters
  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);
  Stream<bool> get isValid => CombineLatestStream.combine2(
      emailStream, passwordStream, (emailSttream, passwordStream) => true);

  //Setters

  Function(String) get emailSink => _email.sink.add;
  Function(String) get passwordSink => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
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
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (passwordStream, sink) {
    if (passwordStream.length < 10 || passwordStream.contains(" ")) {
      sink.addError("Password wrong");
    } else {
      sink.add(passwordStream);
    }
  });
}
