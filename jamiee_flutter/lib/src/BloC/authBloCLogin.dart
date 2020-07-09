import 'package:rxdart/rxdart.dart';
import 'dart:async';

class AuthBloCLogin {
  final _emailLogin = BehaviorSubject<String>();
  final _passwordLogin = BehaviorSubject<String>();

  //Getter
  Stream<String> get emailLoginStream =>
      _emailLogin.stream.transform(emailValidation);
  Stream<String> get passwordLoginStream =>
      _passwordLogin.stream.transform(passwordValidation);

  //Setters

  void emailLoginSink(String _email) {
    _emailLogin.sink.add(_email);
  }

  Function(String) get passwordLoginSink => _passwordLogin.sink.add;

  final emailValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (_emailStream, sink) {
    if (_emailStream == "null") {
      sink.addError("Please Enter Email");
    } else if (_emailStream.length < 10) {
      sink.addError("RegExp not full-filled email");
    } else {
      sink.add(_emailStream);
    }
  });

  final passwordValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (_passwordStream, sink) {
    if (_passwordStream == "null") {
      sink.addError("Please Enter Password");
    } else if (_passwordStream.length < 10) {
      sink.addError("RegExp not full-filled passwor");
    } else {
      sink.add(_passwordStream);
    }
  });

  void dispose() {
    _emailLogin.close();
    _passwordLogin.close();
    print("Disposed");
  }
}

void check() {
  AuthBloCLogin _authBloCLogin = AuthBloCLogin();
  _authBloCLogin.emailLoginStream.listen((event) {});
}
