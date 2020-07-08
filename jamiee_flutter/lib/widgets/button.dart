import 'package:flutter/material.dart';
import 'package:jamiee_flutter/styles/base.dart';
import 'package:jamiee_flutter/styles/text.dart';

class AppLoginButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;

  const AppLoginButton({@required this.title, @required this.color, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      
    
      minWidth: MediaQuery.of(context).size.width,
      height: BaseStyles.loginWidgetHeight,
      child: RaisedButton(
      
        color: color,
        onPressed: onTap,
        shape: RoundedRectangleBorder(borderRadius: BaseStyles.radius),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.loginButtonText,
        ),
      ),
    );
  }
}
