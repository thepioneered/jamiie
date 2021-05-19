class DashboardModel {
  bool response;
  String name;
  String imgUrl;
  int moneySaved;
  int createdPools;
  int joinedPools;
  int completedPools;
  String transactionString;
  String upcomingPaymentString;
  List<TransactionDashboard> transactionList;
  List<UpcomingPayments> upcomingPaymentList;

  DashboardModel({
    this.response,
    this.name,
    this.moneySaved,
    this.createdPools,
    this.transactionList,
    this.completedPools,
    this.joinedPools,
    this.upcomingPaymentList,
    this.imgUrl,
    this.transactionString,
    this.upcomingPaymentString
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    if (!json["response"]) {
        print("here");
      return DashboardModel(
        response: json["response"],
        name: json["name"],
        imgUrl: json["image"],
        createdPools: json["createdPools"],
        joinedPools: json["joinedPools"],
        completedPools: json["completedPools"],
        moneySaved: json["moneySaved"],
        transactionString: json["transactions"],
        upcomingPaymentString: json["upcomingPayments"],
      );
    } else {
      List<TransactionDashboard> transactionList = List<TransactionDashboard>();
      List<UpcomingPayments> upcomingPaymentList = List<UpcomingPayments>();
      List<dynamic> jsonUpcomingPayment = json["upcomingPayments"];
      List<dynamic> jsonTransaction = json["transactions"];
      upcomingPaymentList =
          jsonUpcomingPayment.map((e) => UpcomingPayments.fromJson(e)).toList();
      transactionList =
          jsonTransaction.map((e) => TransactionDashboard.fromJson(e)).toList();

      return DashboardModel(
        response: json["response"],
        name: json["name"],
        imgUrl: json["image"],
        createdPools: json["createdPools"],
        joinedPools: json["joinedPools"],
        completedPools: json["completedPools"],
        moneySaved: json["moneySaved"],
        transactionList: transactionList,
        upcomingPaymentList: upcomingPaymentList,
      );
    }
  }
}

class TransactionDashboard {
  int id;
  String amount;
  String paidTime;
  String transactionUrl;
  bool transactionStatus;
  bool lateTransactionStatus;
  String payDate;
  String poolId;
  String phone;

  TransactionDashboard.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        amount = json["amount"],
        paidTime = json["paidTime"],
        transactionUrl = json["transactionUrl"],
        transactionStatus = json["transactionStatus"],
        lateTransactionStatus = json["lateTransactionStatus"],
        payDate = json["payDate"],
        poolId = json["poolId"],
        phone = json["phone"];
}

class UpcomingPayments {
  String id;
  String name;
  String amount;
  String date;
  // UpcomingPayments({this.amount, this.date, this.id, this.name});
  UpcomingPayments.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        amount = json["amount"],
        id = json["id"],
        date = json["date"];
}
