import 'package:flutter/material.dart';

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
          Text(title),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 50.0,
            color: Colors.grey[100],
            padding: EdgeInsets.all(5.0),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: isPassword != null
                    ? GestureDetector(
                        onTap: () {
                          print("Password Tapped");
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                      )
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
