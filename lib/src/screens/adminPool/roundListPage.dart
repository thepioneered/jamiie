import 'package:Jamiie/src/providers/adminPool/chooseRoundProvider.dart';
import 'package:provider/provider.dart';

import '../../models/adminPoolModel/completePoolDataModel.dart';
import '../../widgets/pageHeading.dart';

import '../../widgets/appBar.dart';
import '../../widgets/button/appButton.dart';
import 'package:flutter/material.dart';

class ChooseRoundPage extends StatelessWidget {
  final List<MemberModel> memberModel;

  const ChooseRoundPage({this.memberModel});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChooseRoundProvider(),
      child: ReorderableListWidget(
        memberModel: memberModel,
      ),
    );
  }
}

class ReorderableListWidget extends StatefulWidget {
  final List<MemberModel> memberModel;

  const ReorderableListWidget({this.memberModel});
  @override
  _ReorderableListWidget createState() => _ReorderableListWidget(memberModel);
}

class _ReorderableListWidget extends State<ReorderableListWidget> {
  final List<MemberModel> memberModel;

  _ReorderableListWidget(this.memberModel);

  @override
  Widget build(BuildContext context) {
    var chooseRoundPage = Provider.of<ChooseRoundProvider>(context);
    double height = MediaQuery.of(context).size.height - 75.0;
    return Scaffold(
      key: chooseRoundPage.chooseRoundScaffoldKey,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: PageHeading.topHeading(
                  title: "Confirm round in pool",
                  subTitle: "Drag the pool",
                  height: height),
            ),
            Container(
              height: height * 0.60,
              child: ReorderableListView(
                onReorder: _onReorder,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                children: List.generate(
                  memberModel.length,
                  (index) {
                    return ListViewCard(
                      index,
                      Key('$index'),
                      memberModel[index].memberDetails.name,
                      index.toString(),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: height * 0.07,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: AppButton.loginButton(
                  onTap: () {
                    memberModel.forEach((element) {
                      print(element.memberDetails.name);
                    });
                    chooseRoundPage.startPoolButton(memberModel);
                  },
                  title: "Confirm Rounds"),
            ),
          ],
        ),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        // final String item = alphabetList.removeAt(oldIndex);
        final MemberModel item = memberModel.removeAt(oldIndex);
        memberModel.insert(newIndex, item);
        // alphabetList.insert(newIndex, item);
      },
    );
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  // final List<String> listItems;
  final String name;
  final String sno;

  // final List<MemberModel> listItems;

  ListViewCard(this.index, this.key, this.name, this.sno);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Card(
        margin: EdgeInsets.all(4),
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.blue,
          onTap: () => print("Done"),
          //  Fluttertoast.showToast(
          // msg: "Item ${widget.listItems[widget.index]} selected.",
          // toastLength: Toast.LENGTH_SHORT),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        // 'Title ${widget.listItems[widget.index]}',
                        widget.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.left,
                        maxLines: 5,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.sno,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                        textAlign: TextAlign.left,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(
                  Icons.reorder,
                  color: Colors.grey,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
