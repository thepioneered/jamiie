class ConfirmLoanModel {

  String response;

  ConfirmLoanModel({this.response});
  
  ConfirmLoanModel.fromJson(Map<String, dynamic> json) : response = json["response"];
}
