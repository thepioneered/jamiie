import 'package:flutter/material.dart';

class NewGroup extends StatefulWidget {
  final Function addGroup;
  NewGroup(this.addGroup);
  @override
  _NewGroupState createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {

  final titleController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    if(enteredTitle.isEmpty){
      return;
    }
    widget.addGroup(enteredTitle);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
           
            FlatButton(
              child: Text('Add Group'),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}