class DashboardModel {
  String name;
  int moneySaved;
  int createdPools;
  int joinedPools;
  int completedPools;
  String imgUrl;
  List<Transaction> transaction;
  List<UpcomingPayments> upcomingPayment;

  DashboardModel({
    this.name,
    this.moneySaved,
    this.createdPools,
    this.transaction,
    this.completedPools,
    this.joinedPools,
    this.upcomingPayment,
    this.imgUrl,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    List<Transaction> transactionList = List<Transaction>();
    List<UpcomingPayments> upcomingPaymentList = List<UpcomingPayments>();
    List<dynamic> jsonUpcomingPayment = json["upcomingPayments"];
    List<dynamic> jsonTransaction = json["transactions"];
    upcomingPaymentList =
        jsonUpcomingPayment.map((e) => UpcomingPayments.fromJson(e)).toList();
    transactionList =
        jsonTransaction.map((e) => Transaction.fromJson(e)).toList();

    return DashboardModel(
      name: json["name"],
      moneySaved: json["moneySaved"],
      createdPools: json["createdPools"],
      completedPools: json["completedPools"],
      joinedPools: json["joinedPools"],
      imgUrl: json["image"],
      transaction: transactionList,
      upcomingPayment: upcomingPaymentList,
    );
  }
}

class Transaction {
  String id;
  String name;
  int amount;
  String date;
  String transactionType;

  Transaction.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        amount = json["amount"],
        id = json["id"],
        date = json["date"],
        transactionType = json["transactionType"];
        
}

class UpcomingPayments {
  String id;
  String name;
  int amount;
  String date;

  UpcomingPayments.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        amount = json["amount"],
        id = json["id"],
        date = json["date"];
}
