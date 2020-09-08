import '../../styles/base.dart';
import '../../widgets/pageHeading.dart';
import 'package:flutter/material.dart';

class GroupModel {
  String text;
  int index;
  GroupModel({this.text, this.index});
}

class GoalSavingPage extends StatefulWidget {
  @override
  _GoalSavingPageState createState() => _GoalSavingPageState();
}

class _GoalSavingPageState extends State<GoalSavingPage> {
  int _currVal = 1;
  String _currText = '';

  List<GroupModel> _group = [
    GroupModel(
      text: "Car",
      index: 1,
    ),
    GroupModel(
      text: "House",
      index: 2,
    ),
    GroupModel(
      text: "Vacation",
      index: 3,
    ),
    GroupModel(
      text: "School/Tuition",
      index: 4,
    ),
    GroupModel(
      text: "Medical",
      index: 5,
    ),
    GroupModel(
      text: "Emergency",
      index: 6,
    ),
    GroupModel(
      text: "Funds",
      index: 7,
    ),
    GroupModel(
      text: "Bill Pay",
      index: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: BaseStyles.topPadding),
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeading.topHeading(
                title: "Select your goal",
                subTitle: "Please select your, why you are saving money",
                height: height),
          
            Expanded(
                child: Container(
              height: 350.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: _group
                    .map((t) => RadioListTile(
                          title: Text("${t.text}"),
                          groupValue: _currVal,
                          value: t.index,
                          onChanged: (val) {
                            setState(() {
                              _currVal = val.index;
                              _currText = t.text;
                            });
                          },
                        ))
                    .toList(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
