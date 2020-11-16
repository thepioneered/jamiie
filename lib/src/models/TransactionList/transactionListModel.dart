class TransactionListModel {
  final List<TransactionModel> transactionList;

  TransactionListModel({this.transactionList});
  factory TransactionListModel.fromJson(Map<String, dynamic> json) {
    List<TransactionModel> _transactionList = List<TransactionModel>();

    //TODO:Pending here
    List<dynamic> list = json["response"];
    _transactionList = list.map((e) => TransactionModel.fromJson(e)).toList();
    return TransactionListModel(
      transactionList: _transactionList,
    );
  }
}

class TransactionModel {
  String amount;
  String paidTime;
  String transactionUrl;
  bool transationStatus;
  bool lateTransactionStatus;
  String payDate;
  String poolId;
  String phone;

  TransactionModel({
    this.amount,
    this.lateTransactionStatus,
    this.paidTime,
    this.payDate,
    this.phone,
    this.poolId,
    this.transactionUrl,
    this.transationStatus,
  });

  TransactionModel.fromJson(Map<String, dynamic> data)
      : amount = data["amount"],
        lateTransactionStatus = data["lateTransactionStatus"],
        paidTime = data["paidTime"],
        payDate = data["payDate"],
        phone = data["phone"],
        poolId = data["poolId"],
        transactionUrl = data["transactionUrl"],
        transationStatus = data["transactionStatus"];
}

// {
//         "id": 1,
//         "amount": "500",
//         "paidTime": "2020-11-11T07:23:50.026695Z",
//         "transactionUrl": "https://api-sandbox.dwolla.com/transfers/83476cd7-ee23-eb11-8128-d55c0669b0b0",
//         "transactionStatus": true,
//         "lateTransactionStatus": false,
//         "payDate": null,
//         "poolId": "cb442ae8",
//         "phone": "+919816456565"
//     }
