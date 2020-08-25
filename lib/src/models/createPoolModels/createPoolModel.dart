class CreatePoolModel {
  String poolName;
  int amount;
  String deadline;
  String poolType;
  String poolMember;

  CreatePoolModel({
    this.poolName,
    this.amount,
    this.deadline,
    this.poolType,
    this.poolMember
  });

  Map<String, dynamic> toJson(String _mobile) => {
        "poolOwner": _mobile,
        "poolName": poolName,
        "contributionAmount": amount,
        "deadline": deadline,
        "poolType": poolType,
        "totalMember": poolMember
      };
}
