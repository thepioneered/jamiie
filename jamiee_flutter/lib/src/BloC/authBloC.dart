import 'dart:async';

import '../utils/validationRegex.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _mobile = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Getters
  Stream<String> get nameStream =>
      _name.stream.transform(AppValidations.nameValidation);
  Stream<String> get emailStream =>
      _email.stream.transform(AppValidations.emailValidation);
  Stream<String> get passwordStream =>
      _password.stream.transform(AppValidations.passwordValidation);
  Stream<String> get mobileStream =>
      _mobile.stream.transform(AppValidations.mobileValidation);

  Stream<bool> get isSignupValid1 => CombineLatestStream.combine2(
      emailStream, mobileStream, (emailStream, mobileStream) => true);

  //Setters
  Function(String) get nameSink => _name.sink.add;
  Function(String) get emailSink => _email.sink.add;
  Function(String) get passwordSink => _password.sink.add;
  Function(String) get mobileSink => _mobile.sink.add;

  void dispose() {
    _name.close();
    _email.close();
    _password.close();
    _mobile.close();
  }
}
