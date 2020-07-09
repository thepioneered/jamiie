import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../BloC/authBloC.dart';
import '../styles/colors.dart';
import '../widgets/button.dart';
import '../widgets/textField.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var check = Provider.of<AuthBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        StreamBuilder<String>(
            stream: check.emailStream,
            builder: (context, snapshot) {
              return TextFieldWidget(
                title: "Email",
                keyboardType: TextInputType.emailAddress,
                onChanged: check.emailSink,
                errorText: snapshot.error,
              );
            }),
        StreamBuilder<String>(
            stream: check.passwordStream,
            builder: (context, snapshot) {
              return TextFieldWidget(
                title: "Password",
                isPassword: true,
                keyboardType: TextInputType.text,
                onChanged: check.passwordSink,
                errorText: snapshot.error,
                passwordFieldType: PasswordFieldType.LoginField,
              );
            }),
        SizedBox(
          height: 20.0,
        ),
        StreamBuilder<bool>(
            stream: check.isValidLogin,
            builder: (context, snapshot) {
              print('+++++++${snapshot.error}++++++');
              return AppLoginButton(
                title: "Login",
                color: AppColors.primaryBlue,
                onTap: snapshot.hasError
                    ? null
                    : () {
                        print("Login Page");
                      },
              );
            })
      ],
    );
  }
}
