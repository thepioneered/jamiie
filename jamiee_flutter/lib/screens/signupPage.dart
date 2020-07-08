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
  @override
  Widget build(BuildContext context) {
    switch (_containerNumber) {
      case 0:
        _child = Column(
          children: <Widget>[
            TextFieldWidget(title: "Name"),
            TextFieldWidget(title: "Email"),
            TextFieldWidget(title: "Mobile No."),
          ],
        );
        break;
      case 1:
        _child = Column(
          children: <Widget>[
            TextFieldWidget(title: "Password"),
            TextFieldWidget(title: "Confirm Password"),
            AppLoginButton(
              color: AppColors.primaryOrange,
              title: "Back",
              onTap: () {
                setState(() {
                  _containerNumber--;
                });
              },
            )
          ],
        );
        break;
      case 2:
        _child = Column(
          children: <Widget>[
            TextFieldWidget(title: "Select City"),
            TextFieldWidget(title: "Select State"),
            AppLoginButton(
              color: AppColors.primaryOrange,
              title: "Back",
              onTap: () {
                setState(() {
                  _containerNumber--;
                });
              },
            )
          ],
        );
        break;
      default:
        _child = Column(
          children: <Widget>[
            TextFieldWidget(title: "Name"),
            TextFieldWidget(title: "Email"),
            TextFieldWidget(title: "Mobile No."),
          ],
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
        _containerNumber == 2
            ? AppLoginButton(
                color: AppColors.primaryBlue,
                title: "Proceed",
                onTap: () {
                  print("Submit Pressed");
                },
              )
            : AppLoginButton(
                color: AppColors.primaryBlue,
                title: "Next",
                onTap: () {
                  setState(() {
                    _containerNumber++;
                  });
                },
              )
      ],
    );
  }
}
