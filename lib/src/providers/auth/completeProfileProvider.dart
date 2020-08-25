import 'dart:io';

import 'package:Jamiie/src/models/pageModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileProvider extends ChangeNotifier {
  final completeProfileScaffoldKey = GlobalKey<ScaffoldState>();
  final completeProfileFormKey = GlobalKey<FormState>();

  PageModel pageModel;

  CompleteProfileProvider() {
    pageModel = PageModel();
  }

  void completeProfileLogin() {
    pageModel.onceFormSubmitted = false;
    notifyListeners();

    if (completeProfileFormKey.currentState.validate()) {}
  }
}

class ImageProviderCompleteProfile extends ChangeNotifier {
  File image;
  ImagePicker imagePicker;
  bool isImage;

  ImageProviderCompleteProfile() {
    imagePicker = ImagePicker();
  }
  Future getImage() async {
    try {
      final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
      image = File(pickedFile.path);
      isImage = true;
      notifyListeners();
    } catch (e) {
      print("Error in image");
    }
  }
}
