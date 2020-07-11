import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../BloC/authBloC.dart';
import '../styles/colors.dart';
import '../widgets/button.dart';
import '../widgets/textField.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int _containerNumber = 0;
  Widget _child;
  StreamBuilder _appLoginButton;
  @override
  Widget build(BuildContext context) {
    print("+++++++++Signup Build+++++++++");
    var _authBloc = Provider.of<AuthBloc>(context);
    switch (_containerNumber) {
      case 0:
        _child = Column(
          children: <Widget>[
            TextFieldWidget(
              title: "Name",
              keyboardType: TextInputType.text,
            ),
            StreamBuilder<String>(
                stream: _authBloc.emailStream,
                builder: (context, snapshot) {
                  return TextFieldWidget(
                    title: "Email",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: _authBloc.emailSink,
                    errorText: snapshot.error,
                  );
                }),
            StreamBuilder<String>(
                stream: _authBloc.mobileStream,
                builder: (context, snapshot) {
                  return TextFieldWidget(
                    title: "Mobile No.",
                    keyboardType: TextInputType.number,
                    onChanged: _authBloc.mobileSink,
                    errorText: snapshot.error,
                  );
                }),
          ],
        );
        _appLoginButton = StreamBuilder<bool>(
            stream: _authBloc.isSignupValid1,
            builder: (context, snapshot) {
              return AppLoginButton(
                color: AppColors.primaryBlue,
                title: "Next",
                onTap: snapshot.hasError
                    ? null
                    : () {
                        setState(() {
                          _containerNumber++;
                        });
                      },
              );
            });
        break;
      case 1:
        _child = Column(
          children: <Widget>[
            TextFieldWidget(
              title: "Password",
              keyboardType: TextInputType.text,
              isPassword: true,
              passwordFieldType: PasswordFieldType.SignupField,
            ),
            TextFieldWidget(
              title: "Confirm Password",
              keyboardType: TextInputType.text,
              isPassword: true,
              passwordFieldType: PasswordFieldType.SignupConfirmField,
            ),
            AppLoginButton(
              color: AppColors.primaryOrange,
              title: "Back",
              onTap: () {
                setState(() {
                  _containerNumber--;
                });
              },
            ),
          ],
        );
        _appLoginButton = StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return AppLoginButton(
                color: AppColors.primaryBlue,
                title: "Next",
                onTap: () {
                  setState(() {
                    _containerNumber++;
                  });
                },
              );
            });
        break;
      case 2:
        _child = Column(
          children: <Widget>[
            TextFieldWidget(
              title: "Select City",
              keyboardType: TextInputType.text,
            ),
            TextFieldWidget(
              title: "Select State",
              keyboardType: TextInputType.text,
            ),
            AppLoginButton(
              color: AppColors.primaryOrange,
              title: "Back",
              onTap: () {
                setState(() {
                  _containerNumber--;
                });
              },
            ),
          ],
        );

        _appLoginButton = StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return AppLoginButton(
                color: AppColors.primaryBlue,
                title: "Proceed",
                onTap: () {
                  print("Submit Pressed");
                },
              );
            });
        break;
      default:
        _containerNumber = 0;
        _child = Column(
          children: <Widget>[
            TextFieldWidget(
              title: "Name",
              keyboardType: TextInputType.text,
            ),
            TextFieldWidget(
              title: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            TextFieldWidget(
                title: "Mobile No.", keyboardType: TextInputType.number),
          ],
        );
        AppLoginButton(
          color: AppColors.primaryOrange,
          title: "Back",
          onTap: () {
            setState(() {
              _containerNumber--;
            });
          },
        );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.41,
            child: SingleChildScrollView(child: _child)),
        SizedBox(
          height: 20.0,
        ),
        _appLoginButton
      ],
    );
  }
}
