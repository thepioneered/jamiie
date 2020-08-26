import 'dart:io';
import 'package:Jamiie/src/models/completeProfileModel.dart';
import 'package:Jamiie/src/models/pageModel.dart';
import 'package:Jamiie/src/screens/AfterLoginForm/form.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as justPath;
import 'package:path_provider/path_provider.dart' as path;
import 'package:http/http.dart' as http;

class CompleteProfileProvider extends ChangeNotifier {
  final completeProfileScaffoldKey = GlobalKey<ScaffoldState>();
  final completeProfileFormKey = GlobalKey<FormState>();
  CompleteProfileModel completeProfileModel;

  DateTime selectedDate;
  TextEditingController date = TextEditingController();
  PageModel pageModel;

  CompleteProfileProvider() {
    selectedDate = DateTime.now();
    completeProfileModel = CompleteProfileModel();
    pageModel = PageModel();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      date.value =
          TextEditingValue(text: selectedDate.toString().substring(0, 10));
    }
  }

  void completeProfileLogic() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();

    if (completeProfileFormKey.currentState.validate()) {
      completeProfileFormKey.currentState.save();
      // try {
      //   LoaderDialog.loaderDialog(completeProfileScaffoldKey.currentContext);
      // } catch (e) {
      //   print("Error At Login Provider in Loader Dialog!");
      //   throw Exception(e);
      // }
      print(completeProfileModel.date);
      // Map<String, dynamic> body = await NetworkCalls.postDataToServer(
      //   key: completeProfileScaffoldKey,
      //   endPoint: EndPoints.completeProfile,
      //   afterRequest: () {},
      //   authRequest: true,
      //   body: completeProfileModel.toJson(
      //       await LocalStorage.getMobile(), savedImage),
      // );
      print(savedImage.path);

      var postUri = Uri.parse(EndPoints.ipAddress);
      var request = http.MultipartRequest("POST", postUri);
      request.fields['user'] = 'blah';
      request.fields["phone"] = "+917071006000";
      request.fields["street"] = "a";
      request.fields["city"] = "A";
      request.fields["state"] = "a";
      request.fields["DOB"] = "2020-08-29";
      request.fields["zipCode"] = "2442";
      request.fields["addressAge"] = "424";
      request.fields["securityNumber"] = "2442";
      request.fields["employerName"] = "t";
      request.fields["employerAge"] = "3";
      request.files.add(await http.MultipartFile.fromPath(
        'images',
        savedImage.path,
        // contentType: MediaType('application', 'jpg'),
      ));

      var respose = await request.send();
      print(respose.statusCode);
      // request.send().then((response) {
      //   if (response.statusCode == 200) print("Uploaded!");
      // });

      // if (body["status"]) {
      //   pageModel.onceClicked = false;
      //   notifyListeners();
      //   await LocalStorage.setisProfileComplete();
      //   Navigator.pop(completeProfileScaffoldKey.currentContext);
      //   Navigator.pushReplacementNamed(
      //       completeProfileScaffoldKey.currentContext, "/AfterLoginFormPage");
      // } else {
      //   pageModel.onceClicked = false;
      //   notifyListeners();
      // }

      // completeProfileModel.toJson("+917071006000")

      // Navigator.push(completeProfileScaffoldKey.currentContext,
      //     MaterialPageRoute(builder: (_) => AfterLoginFormPage()));
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
