import 'dart:convert';
import 'dart:io';

class CompleteProfileModel {
  String street;
  String city;
  String state;
  String date;
  String zipcode;
  String ssn;
  String employerName;
  String howLongwithEmployer;
  String howLongatAddress;

  //
  CompleteProfileModel(
      {this.state,
      this.city,
      this.date,
      this.employerName,
      this.howLongatAddress,
      this.howLongwithEmployer,
      this.ssn,
      this.street,
      this.zipcode});

  Map<String, dynamic> toJson(String _mobile, File image) {
    print(image.path);
    return {
      "image": base64Encode(image.readAsBytesSync()),
      "phone": _mobile,
      "street": street,
      "city": city,
      "state": state,
      "DOB": date,
      "zipCode": zipcode,
      "addressAge": howLongatAddress,
      "securityNumber": ssn,
      "employerName": employerName,
      "employerAge": howLongatAddress
    };
  }
}
