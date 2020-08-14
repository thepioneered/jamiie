import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
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
          tooltip: "Create Pool",
          onPressed: () {
            //TODOOOOOOOOO bd main thik krna hai isko
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreatePoolPage()));
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
              ),
              _data(),
              _data(),
              _data(),
            ],
          ),
        ));
  }

  Widget _data() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        height: MediaQuery.of(context).size.height / 2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pool Name",
                  style: AppTextStyle.poolTitle,
                ),
                Text(
                  "Status",
                  style: AppTextStyle.subheadingText,
                )
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$ 124.0",
                    style: AppTextStyle.amountStyle,
                  ),
                  Text("Monthly per person",
                      style: AppTextStyle.amountSubHeading)
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pool Members",
                    style: AppTextStyle.inputText,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  Container(
                    height: 50.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return CircleAvatar(
                          radius: 30.0,
                          backgroundColor: AppColors.primaryColorPurple,
                          backgroundImage: AssetImage("assets/logo3.png"),
                        );
                      },
                    ),
                  )

                  // })
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}
