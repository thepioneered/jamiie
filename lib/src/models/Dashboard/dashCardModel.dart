var data = {
  "name": "Mark",
  "moneySaved": 1000,
  "createdPools": 9,
  "joinedPools": 12,
  "completedPools": 23,
  "transactions": [],
  "upcomingPayments": [],
};

class DashboardModel {
  String name;
  int moneySaved;
  int createdPools;
  int joinedPools;
  int completedPools;

  PoolNumbers poolNumbers;
  List<Transaction> transaction;
  DashboardModel(
      {this.name, this.moneySaved, this.poolNumbers, this.transaction});

  factory DashboardModel.fromJsom(Map<String, dynamic> json) {

    List<dynamic> list = List<dynamic>();
    
    return DashboardModel(
      name: json["name"],
      moneySaved: json["moneySaved"],
     
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
  DateTime date;

  Transaction({this.amount, this.date, this.id, this.name});
}
