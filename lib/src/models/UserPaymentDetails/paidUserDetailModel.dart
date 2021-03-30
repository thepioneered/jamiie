class PaidUserListModel {
  final List<PaidUserModel> paidUserList;

  PaidUserListModel({this.paidUserList});
  factory PaidUserListModel.fromJson(Map<String, dynamic> json) {
    List<PaidUserModel> _paidUserList = <PaidUserModel>[];

    List<dynamic> list = json["response"];
    _paidUserList = list.map((e) => PaidUserModel.fromJson(e)).toList();
    return PaidUserListModel(
      paidUserList: _paidUserList,
    );
  }
}

class PaidUserModel {
  int id;
  String amount;
  String paidTime;
  String transactionUrl;
  bool transationStatus;
  bool lateTransactionStatus;
  String payDate;
  String poolId;
  String phone;

  PaidUserModel({
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

  PaidUserModel.fromJson(Map<String, dynamic> data)
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
