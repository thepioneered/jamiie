import 'dart:io';
import 'package:Jamiie/src/widgets/settings/logoutDialog.dart';

import '../../models/auth/completeProfileModel.dart';
import '../../models/base/pageModel.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../styles/colors.dart';
import '../../utils/sharedPref.dart';
import '../../utils/snackBar.dart';
import '../../widgets/loaderDialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as justPath;
import 'package:path_provider/path_provider.dart' as path;
import 'package:intl/intl.dart';

class CompleteProfileProvider extends ChangeNotifier {
  final completeProfileScaffoldKey = GlobalKey<ScaffoldState>();
  final completeProfileFormKey = GlobalKey<FormState>();
  CompleteProfileModel completeProfileModel;

  DateTime selectedDate;
  TextEditingController date = TextEditingController();
  PageModel pageModel;
  final DateFormat formatter = DateFormat('MM-dd-yyyy');


  CompleteProfileProvider() {
    selectedDate = DateTime.now();
    completeProfileModel = CompleteProfileModel();
    pageModel = PageModel();
  }

  void callListners() {
    notifyListeners();
  }

  String validator(String value) {
    if (value == null) {
      return "Please select an option!";
    } else {
      return null;
    }
  }

  Future<bool> handleLogout() {
    appLogoutDialog(
      completeProfileScaffoldKey.currentContext,
      () async {
        Navigator.pop(completeProfileScaffoldKey.currentContext);
        try {
          LoaderDialog.loaderDialog(completeProfileScaffoldKey.currentContext);
        } catch (e) {
          print("Error At Logout Provider in Loader Dialog!");
          throw Exception(e);
        }
        print(await LocalStorage.getMobile());
        print(await LocalStorage.getToken());
        print(EndPoints.ipAddress + EndPoints.userlogout);
        Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          shouldPagePop: true,
          key: completeProfileScaffoldKey,
          endPoint: EndPoints.userlogout,
          authRequest: true,
          afterRequest: () {},
          body: {
            "phone": await LocalStorage.getMobile(),
          },
        );

        if (body["status"]) {
          await LocalStorage.deleteData();
          Navigator.pop(completeProfileScaffoldKey.currentContext);
          Navigator.pushNamedAndRemoveUntil(
            completeProfileScaffoldKey.currentContext,
            "/LoginPage",
            (route) => false,
          );
          return false;
        } else {
          return false;
        }
      },
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      date.value =
          TextEditingValue(text: selectedDate.toString().substring(0,10));
    }
  }

  void completeProfileLogic() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();

    if (completeProfileFormKey.currentState.validate() && savedImage != null) {
      completeProfileFormKey.currentState.save();
      try {
        LoaderDialog.loaderDialog(completeProfileScaffoldKey.currentContext);
      } catch (e) {
        print("Error At Login Provider in Loader Dialog!");
        throw Exception(e);
      }
      // print(completeProfileModel.toJson(await LocalStorage.getMobile()));
      // print(completeProfileModel.toJson(await LocalStorage.getToken()));

      Map<String, dynamic> body = await NetworkCalls.multiPartRequest(
          shouldPagePop: true,
          key: completeProfileScaffoldKey,
          endPoint: EndPoints.completeProfile,
          body: completeProfileModel.toJson(await LocalStorage.getMobile()),
          savedImage: savedImage);
      if (body["status"]) {
        pageModel.onceFormSubmitted = false;
        notifyListeners();
        await LocalStorage.setisProfileComplete();
        completeProfileFormKey.currentState.reset();
        Navigator.pop(completeProfileScaffoldKey.currentContext);
        Navigator.pushReplacementNamed(
            completeProfileScaffoldKey.currentContext, "/AfterLoginFormPage");
      }
    } else {
      if (savedImage == null) {
        completeProfileScaffoldKey.currentState.showSnackBar(
          AppSnackBar.snackBar(
              title: "Please select image", backgroundColor: AppColors.red),
        );
      }
    }
  }
}

File savedImage;

class ImageProviderCompleteProfile extends ChangeNotifier {
  File image;

  ImagePicker imagePicker;
  bool isImage;

  ImageProviderCompleteProfile() {
    imagePicker = ImagePicker();
  }

  Future getImage() async {
    try {
      final pickedFile = await imagePicker.getImage(
          source: ImageSource.camera, maxWidth: 200, maxHeight: 200);
      image = File(pickedFile.path);
      final appDir = await path.getTemporaryDirectory();
      final fileName = justPath.basename(image.path);
      savedImage = await image.copy('${appDir.path}/$fileName');
      isImage = true;
      notifyListeners();
    } catch (e) {
      print("Error in image");
    }
  }
}
