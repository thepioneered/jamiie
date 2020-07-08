import 'package:flutter/material.dart';
import 'package:jamiee_flutter/styles/colors.dart';
import 'package:jamiee_flutter/widgets/button.dart';
import 'package:jamiee_flutter/widgets/textField.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int _containerNumber = 0;
  Widget _child;
  AppLoginButton _appLoginButton;
  @override
  Widget build(BuildContext context) {
    print("+++++++++Signup Build+++++++++");
    switch (_containerNumber) {
      case 0:
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
              title: "Mobile No.",
              keyboardType: TextInputType.number,
            ),
          ],
        );
        _appLoginButton = AppLoginButton(
          color: AppColors.primaryBlue,
          title: "Next",
          onTap: () {
            setState(() {
              _containerNumber++;
            });
          },
        );
        break;
      case 1:
        _child = Column(
          children: <Widget>[
            TextFieldWidget(
              title: "Password",
              keyboardType: TextInputType.text,
            ),
            TextFieldWidget(
              title: "Confirm Password",
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
        _appLoginButton = AppLoginButton(
          color: AppColors.primaryBlue,
          title: "Next",
          onTap: () {
            setState(() {
              _containerNumber++;
            });
          },
        );
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

        _appLoginButton = AppLoginButton(
          color: AppColors.primaryBlue,
          title: "Proceed",
          onTap: () {
            print("Submit Pressed");
          },
        );
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
