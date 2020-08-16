class CreatePoolModel {
  String poolName;
  String amount;
  String date;
  String poolType;
  int minPeople;
  int maxPeople;

  CreatePoolModel({
    this.poolName,
    this.amount,
    this.minPeople,
    this.maxPeople,
    this.date,
    this.poolType,
  });
}
