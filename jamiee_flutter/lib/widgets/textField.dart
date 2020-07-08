import 'package:flutter/material.dart';
import 'package:jamiee_flutter/styles/base.dart';
import 'package:jamiee_flutter/styles/colors.dart';
import 'package:jamiee_flutter/styles/text.dart';
// import 'package:jamiee_flutter/styles/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final bool isPassword;

  const TextFieldWidget({
    @required this.title,
    this.isPassword,
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
              decoration: BoxDecoration(
                boxShadow: BaseStyles.boxShadow,
                color: AppColors.white,
                borderRadius: BaseStyles.radius,
              ),
              height: BaseStyles.loginWidgetHeight,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
