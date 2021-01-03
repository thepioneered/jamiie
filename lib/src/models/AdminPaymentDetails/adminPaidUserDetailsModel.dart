class AdminPaidUserListModel {
  final List<AdminPaidUserModel> adminpaidUserList;

  AdminPaidUserListModel({this.adminpaidUserList});
  factory AdminPaidUserListModel.fromJson(Map<String, dynamic> json) {
    List<AdminPaidUserModel> _adminpaidUserList = List<AdminPaidUserModel>();

    List<dynamic> list = json["response"];
    _adminpaidUserList = list.map((e) => AdminPaidUserModel.fromJson(e)).toList();
    return AdminPaidUserListModel(
      adminpaidUserList: _adminpaidUserList,
    );
  }
}

class AdminPaidUserModel {
  int id;
  String amount;
  String paidTime;
  String transactionUrl;
  bool transationStatus;
  bool lateTransactionStatus;
  String payDate;
  String poolId;
  String phone;

  AdminPaidUserModel({
    this.id,
    this.amount,
    this.lateTransactionStatus,
    this.paidTime,
    this.payDate,
    this.phone,
    this.poolId,
    this.transactionUrl,
    this.transationStatus,
  });

  AdminPaidUserModel.fromJson(Map<String, dynamic> data)
      : id = data["id"],
        amount = data["amount"],
        lateTransactionStatus = data["lateTransactionStatus"],
        paidTime = data["paidTime"],
        payDate = data["payDate"],
        phone = data["phone"],
        poolId = data["poolId"],
        transactionUrl = data["transactionUrl"],
        transationStatus = data["transactionStatus"];
}
