import '../../providers/adminPool/chooseRoundProvider.dart';
import '../../styles/text.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/adminPoolModel/completePoolDataModel.dart';

import '../../widgets/appBar.dart';
import '../../widgets/button/appButton.dart';
import 'package:flutter/material.dart';

class ChooseRoundPage extends StatelessWidget {
  final List<MemberModel> memberModel;
  final String poolId;

  const ChooseRoundPage({this.memberModel, this.poolId});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChooseRoundProvider(),
      child: ReorderableListWidget(
        memberModel: memberModel,
        poolId: poolId,
      ),
    );
  }
}

class ReorderableListWidget extends StatefulWidget {
  final List<MemberModel> memberModel;
  final String poolId;

  const ReorderableListWidget({this.memberModel, this.poolId});
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
                      (index + 1).toString(),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 170.h,
            ),
            Container(
              height: height * 0.07,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: AppButton.loginButton(
                  onTap: () {
                    chooseRoundPage.startPoolButton(memberModel, widget.poolId);
                  },
                  title: "Start Pool"),
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
        final MemberModel item = memberModel.removeAt(oldIndex);
        memberModel.insert(newIndex, item);
      },
    );
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final String name;
  final String sno;

  ListViewCard(this.index, this.key, this.name, this.sno);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(4),
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.blue,
          onTap: () => print("Done"),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Text(
                  widget.sno + " .",
                  style: AppTextStyle.reorderableList,
                  textAlign: TextAlign.left,
                  maxLines: 5,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Text(
                  widget.name,
                  style: AppTextStyle.reorderableList,
                  textAlign: TextAlign.left,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
