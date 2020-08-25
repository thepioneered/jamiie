import 'package:flutter/material.dart';

class EditProfileProvider with ChangeNotifier {
  bool editButtonClicked;
  IconData icon;

  EditProfileProvider() {
    icon = Icons.edit;
    editButtonClicked = false;
  }

  void handleEditButton() {
    editButtonClicked = !editButtonClicked;
    if (editButtonClicked) {
      icon = Icons.edit;
    } else {
      icon = Icons.done;
    }
    notifyListeners();
  }
}
