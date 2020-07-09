import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/passwordVisible.dart';
import '../styles/base.dart';
import '../styles/colors.dart';
import '../styles/text.dart';
import 'package:provider/provider.dart';

// import 'package:jamiee_flutter/styles/colors.dart';
// bool _status = false;

class TextFieldWidget extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextInputType keyboardType;
  final Function onChanged;
  final String errorText;
  final PasswordFieldType passwordFieldType;

  const TextFieldWidget({
    @required this.title,
    this.isPassword,
    @required this.keyboardType,
    this.onChanged,
    this.errorText,
    this.passwordFieldType,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              // SizedBox(
              //   width: 20.0,
              // ),
              Text(
                title,
                style: AppTextStyle.subheadingText,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              padding: EdgeInsets.only(left: 20.0, right: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: BaseStyles.boxShadow,
                color: AppColors.white,
                // borderRadius: BaseStyles.radius,
              ),
              height: BaseStyles.loginWidgetHeight,
              child: isPassword == null
                  ? TextField(
                      keyboardType: keyboardType,
                      onChanged: onChanged,
                      onEditingComplete: () => print("Completed"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    )
                  : PasswordTextField(
                      keyboardType: keyboardType,
                      onChanged: onChanged,
                      passwordFieldType: passwordFieldType,
                    )),
          errorText != null
              ? Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    errorText,
                    style: AppTextStyle.errorText,
                  ))
              : Container(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final Function onChanged;
  final TextInputType keyboardType;
  final PasswordFieldType passwordFieldType;

  const PasswordTextField(
      {@required this.onChanged,
      @required this.keyboardType,
      @required this.passwordFieldType});
  @override
  Widget build(BuildContext context) {
    print("+++++Password Text Build+++++");
    bool _obscureText;
    Function _onTap;
    var _passwordStatus = Provider.of<PasswordStatus>(context);
    switch (passwordFieldType) {
      case PasswordFieldType.LoginField:
        _obscureText = _passwordStatus.getStatusLogin();
        _onTap = () {
          _passwordStatus.setStatusLogin();
        };
        break;
      case PasswordFieldType.SignupField:
        _obscureText = _passwordStatus.getStatusSignupPassword();
        _onTap = () {
          _passwordStatus.setStatusSignupPassword();
        };
        break;
      case PasswordFieldType.SignupConfirmField:
        _obscureText = _passwordStatus.getStatusConfirmPassword();
        _onTap = () {
          _passwordStatus.setStatusConfirmPassword();
        };
        break;
      default:
        _obscureText = _passwordStatus.getStatusLogin();
        _onTap = () {
          _passwordStatus.setStatusLogin();
        };
        break;
    }

    return TextField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      onEditingComplete: () => print("Completed"),
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: _onTap,
          child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        border: InputBorder.none,
      ),
    );
  }
}

enum PasswordFieldType {
  LoginField,
  SignupField,
  SignupConfirmField,
}
