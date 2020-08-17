class CreatePoolModel {
  String poolName;
  String amount;
  String deadline;
  String poolType;
  int minPeople;
  int maxPeople;

  CreatePoolModel({
    this.poolName,
    this.amount,
    this.minPeople,
    this.maxPeople,
    this.deadline,
    this.poolType,
  });

  Map<String, dynamic> toJson(String _mobile) => {
        "poolowner": _mobile,
        "poolname": poolName,
        "poolamount": amount,
        "deadline": deadline,
        "pooltype": poolType,
        "minmember": minPeople,
        "maxmember": maxPeople
      };
}
