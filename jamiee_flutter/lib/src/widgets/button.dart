import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import '../styles/base.dart';
import '../styles/text.dart';

class AppLoginButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final Function onTap;
  final double width;
  final ShapeBorder shapeBorder;

  const AppLoginButton(
      {@required this.title,
      @required this.color,
      @required this.onTap,
      this.width,
      this.shapeBorder, this.textColor});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: (width == null) ? MediaQuery.of(context).size.width : width,
      height: BaseStyles.loginWidgetHeight,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(BaseStyles.buttonRadius)),
      child: RaisedButton(
        color: color,
        onPressed: onTap,
        shape: shapeBorder,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.loginButtonText(
              textColor != null ? textColor : AppColors.white),
        ),
      ),
    );
  }
}
