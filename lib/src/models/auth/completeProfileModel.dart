
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

  Map<String, String> toJson(String _mobile) {
    return {
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
