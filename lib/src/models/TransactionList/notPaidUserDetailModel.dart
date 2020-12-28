class NotPaidUserListModel {
  final List<NotPaidUserModel> notPaidUserList;

  NotPaidUserListModel({this.notPaidUserList});
  factory NotPaidUserListModel.fromJson(Map<String, dynamic> json) {
    List<NotPaidUserModel> _notPaidUserList = List<NotPaidUserModel>();

    List<dynamic> list = json[""];
    _notPaidUserList = list.map((e) => NotPaidUserModel.fromJson(e)).toList();
    return NotPaidUserListModel(
      notPaidUserList: _notPaidUserList,
    );
  }
}

class NotPaidUserModel {
  String amount;
  DateTime paidTime;
  String transactionUrl;
  bool transationStatus;
  bool lateTransactionStatus;
  DateTime payDate;
  String poolId;
  String phone;

  NotPaidUserModel({
    this.amount,
    this.lateTransactionStatus,
    this.paidTime,
    this.payDate,
    this.phone,
    this.poolId,
    this.transactionUrl,
    this.transationStatus,
  });

  NotPaidUserModel.fromJson(Map<String, dynamic> data)
      : amount = data["amount"],
        lateTransactionStatus = data["lateTransactionStatus"],
        paidTime = data["paidTime"],
        payDate = data["payDate"],
        phone = data["phone"],
        poolId = data["poolId"],
        transactionUrl = data["transactionUrl"],
        transationStatus = data["transactionStatus"];
}
