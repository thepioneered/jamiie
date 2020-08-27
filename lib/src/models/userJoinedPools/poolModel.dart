class ShowPoolModel {
  String poolid;
  String poolname;
  String poolowner;
  int poolamount;
  int maxmember;
  int joinedmember;
  String deadline;

  ShowPoolModel.fromJson(Map<String, dynamic> json)
      : poolid = json['poolId'],
        poolname = json['poolName'],
        poolowner = json['poolOwner'],
        poolamount = json['contributionAmount'],
        maxmember = json['totalMember'],
        joinedmember = json['joinedMember'],
        deadline = json['deadline'];
}
