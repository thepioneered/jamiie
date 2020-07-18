import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../styles/text.dart';
import '../utils/icons.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 35.0,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Name",
                          style: AppTextStyle.drawerText,
                        ),
                        Text(
                          "mobile",
                          style: AppTextStyle.drawerText,
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Divider(
            color: Colors.black,
            thickness: 1.0,
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                // color: Colors.red,
                child: Column(
                  children: <Widget>[
                    DrawerContainer(
                      title: "First",
                      onPressed: () {},
                    ),
                    DrawerContainer(
                      title: "First",
                      onPressed: () {},
                    ),
                    DrawerContainer(
                      title: "First",
                      onPressed: () {},
                    ),
                    DrawerContainer(
                      title: "First",
                      onPressed: () {},
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class DrawerContainer extends StatelessWidget {
  final String title;
  final Function onPressed;
  final FaIcon faIcon;

  const DrawerContainer(
      {@required this.title, @required this.onPressed, this.faIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 20.0),
        width: double.infinity,
        height: 50.0,
        child: Row(
          children: <Widget>[
            AppIcons.logoutIcon,
            SizedBox(
              width: 15.0,
            ),
            Text(
              title,
              style: AppTextStyle.drawerText,
            ),
          ],
        ),
      ),
    );
  }
}
