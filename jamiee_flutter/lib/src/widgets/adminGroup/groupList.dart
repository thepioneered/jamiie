import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/models/group.dart';


class GroupList extends StatelessWidget {
  final List<Group> groupsList;
  GroupList(this.groupsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: groupsList.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactios added yet!',
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(),
                      ),
                    ),
                    title: Text(
                      groupsList[index].title,
                    ),
                  ),
                );
              },
              itemCount: groupsList.length,
            ),
    );
  }
}
