class LoanList {
  final List<LoanListModel> loanList;
  LoanList({this.loanList});

  factory LoanList.fromJson(Map<String, dynamic> json) {
    List<LoanListModel> _loanList = List<LoanListModel>();
    List<dynamic> list = json[""];
    _loanList = list.map((e) => LoanListModel.fromJson(e)).toList();
    return LoanList(
      loanList: _loanList,
    );
  }
}

class LoanListModel {
  String phone;
  String poolId;
  int amount;
  String transactionId;
  String createdAt;

  LoanListModel({
    this.amount,
    this.createdAt,
    this.phone,
    this.poolId,
    this.transactionId,
  });

  LoanListModel.fromJson(Map<String, dynamic> data)
      : amount = data["amount"],
        createdAt = data["createdAt"],
        phone = data["phone"],
        poolId = data["poolId"],
        transactionId = data["transactionId"];
}
