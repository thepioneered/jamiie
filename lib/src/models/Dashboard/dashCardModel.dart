var data = {
  "name": "Mark",
  "moneySaved": 1000,
  "createdPools": 9,
  "joinedPools": 12,
  "completedPools": 23,
  "transactions": [
    {
      "id": "1",
      "name": "Pool1",
      "date": "22-08-2020",
      "amount": 1000,
    }
  ],
  "upcomingPayments": [
    {
      "id": "1",
      "name": "Pool1",
      "date": "22-08-2020",
      "amount": 1000,
    }
  ],
};

class DashboardModel {
  String name;
  int moneySaved;
  int createdPools;
  int joinedPools;
  int completedPools;
//  List<Transaction> transaction;
//   List<UpcomingPayments> upcomingPayment;

  DashboardModel({
    this.name,
    this.moneySaved,
    this.createdPools,
  //  this.transaction,
    this.completedPools,
    this.joinedPools,
  //  this.upcomingPayment,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
   print(json["upcomingPayments"]);
    List<Transaction> transactionList = List<Transaction>();
    // List<UpcomingPayments> upcomingPaymentList = List<UpcomingPayments>();
    // List<dynamic> jsonUpcomingPayment = json["upcomingPayments"];
    List<dynamic> jsonTransaction = json["transactions"];
    // upcomingPaymentList =
    //     jsonUpcomingPayment.map((e) => UpcomingPayments.fromJson(e)).toList();
    transactionList =
        jsonTransaction.map((e) => Transaction.fromJson(e)).toList();

    return DashboardModel(
      name: json["name"],
      moneySaved: json["moneySaved"],
      createdPools: json["createdPools"],
      completedPools: json["completesPools"],
      joinedPools: json["joinedPools"],
      // transaction: transactionList,
      // upcomingPayment: upcomingPaymentList,
    );
  }
}

class PoolNumbers {
  int totalAmount;
  int createdPools;
  int joinedPools;
  int completedPools;

  PoolNumbers({
    this.completedPools = 23,
    this.joinedPools = 12,
    this.createdPools = 9,
    this.totalAmount = 1000,
  });
}

class Transaction {
  String id;
  String name;
  double amount;
  String date;

 Transaction.fromJson(Map<String, dynamic> json) :
    name= json["name"],
      amount= json["amount"],
      id= json["id"],
      date= json["date"];
  }


class UpcomingPayments {
  String id;
  String name;
  int amount;
  String date;

  // UpcomingPayments({this.amount, this.date, this.id, this.name});

  UpcomingPayments.fromJson(Map<String, dynamic> json):

    
      name= json["name"],
      amount= json["amount"],
      id= json["id"],
      date= json["date"];
  
}
