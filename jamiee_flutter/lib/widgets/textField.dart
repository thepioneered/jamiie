import 'package:flutter/material.dart';
import 'package:jamiee_flutter/styles/base.dart';
import 'package:jamiee_flutter/styles/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final bool isPassword;

  const TextFieldWidget({@required this.title, this.isPassword});
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
              Text(title),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.black, //TODO
                borderRadius: BaseStyles.radius,
              ),
              height: BaseStyles.loginWidgetHeight,
              padding: EdgeInsets.all(5.0),
              child: null)
        ],
      ),
    );
  }
}
