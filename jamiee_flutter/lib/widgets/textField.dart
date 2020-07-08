import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamiee_flutter/styles/base.dart';
import 'package:jamiee_flutter/styles/colors.dart';
import 'package:jamiee_flutter/styles/text.dart';
// import 'package:jamiee_flutter/styles/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextInputType keyboardType;
  final Function onChanged;
  final String errorText;

  const TextFieldWidget({
    @required this.title,
    this.isPassword,
    @required this.keyboardType,
    this.onChanged,
    this.errorText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
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
                borderRadius: BaseStyles.radius,
              ),
              height: BaseStyles.loginWidgetHeight,
              child: TextField(
                keyboardType: keyboardType,
                onChanged: onChanged,
                onEditingComplete: () => print("Completed"),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
          errorText != null
              ? Container(
                  padding: EdgeInsets.only(left: 20.0, top: 5.0),
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
