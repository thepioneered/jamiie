import '../utils/validationRegex.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class AuthBloCLogin {
  final _emailLogin = BehaviorSubject<String>();
  final _passwordLogin = BehaviorSubject<String>();

  //Getter:

  //1. Email Handler
  Stream<String> get emailLoginStream =>
      _emailLogin.stream.transform(AppValidations.emailValidation);

  //2. Password Handler
  Stream<String> get passwordLoginStream =>
      _passwordLogin.stream.transform(AppValidations.passwordValidation);

  //3. Combining Stream
  Stream<bool> get isValidLogin => CombineLatestStream.combine2(
      emailLoginStream,
      passwordLoginStream,
      (emailSttream, passwordStream) => true);

  //Setters:

  //1. Email sink
  Function(String) get emailLoginSink => _emailLogin.sink.add;

  //2: Password Sink
  Function(String) get passwordLoginSink => _passwordLogin.sink.add;

  void dispose() {
    _emailLogin.close();
    _passwordLogin.close();
    print("Disposed");
  }
}
