import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../screens/adminPool/creatPool.dart';
import '../../styles/colors.dart';

class AdminPool extends StatefulWidget {
  @override
  _AdminPoolState createState() => _AdminPoolState();
}

class _AdminPoolState extends State<AdminPool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODOOOOOOOOO bd main thik krna hai isko
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePoolPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: 200.0,
          child: Text("D"),
        ),
      ),
    );
  }
}
