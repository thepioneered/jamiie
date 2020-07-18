import 'package:flutter/material.dart';
import '../styles/base.dart';
import '../styles/text.dart';

class AppLoginButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;
  final double width;
  final ShapeBorder shapeBorder;

  const AppLoginButton(
      {@required this.title,
      @required this.color,
      @required this.onTap,
      this.width, this.shapeBorder});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: (width == null) ? MediaQuery.of(context).size.width : width,
      height: BaseStyles.loginWidgetHeight,
      child: RaisedButton(
        color: color,
        onPressed: onTap,
        shape: shapeBorder,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.loginButtonText,
        ),
      ),
    );
  }
}
