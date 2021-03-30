class AdminNotPaidUserListModel {
  final List<AdminNotPaidUserModel> adminnotPaidUserList;

  AdminNotPaidUserListModel({this.adminnotPaidUserList});
  factory AdminNotPaidUserListModel.fromJson(Map<String, dynamic> json) {
  
    List<AdminNotPaidUserModel> _adminnotPaidUserList = List<AdminNotPaidUserModel>();

    List<dynamic> list = json[""];
    _adminnotPaidUserList = list.map((e) => AdminNotPaidUserModel.fromJson(e)).toList();
    return AdminNotPaidUserListModel(
      adminnotPaidUserList: _adminnotPaidUserList,
    );
  }
}

class AdminNotPaidUserModel {
  String amount;
  DateTime paidTime;
  String transactionUrl;
  bool transationStatus;
  bool lateTransactionStatus;
  DateTime payDate;
  String poolId;
  String phone;

  AdminNotPaidUserModel({
    this.amount,
    this.lateTransactionStatus,
    this.paidTime,
    this.payDate,
    this.phone,
    this.poolId,
    this.transactionUrl,
    this.transationStatus,
  });

  AdminNotPaidUserModel.fromJson(Map<String, dynamic> data)
      : amount = data["amount"],
        lateTransactionStatus = data["lateTransactionStatus"],
        paidTime = data["paidTime"],
        payDate = data["payDate"],
        phone = data["phone"],
        poolId = data["poolId"],
        transactionUrl = data["transactionUrl"],
        transationStatus = data["transactionStatus"];
}
