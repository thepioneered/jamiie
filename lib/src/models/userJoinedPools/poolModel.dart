class ShowPoolModel {
  String poolid;
  String poolname;
  String poolowner;
  double poolamount;
  int maxmember;
  int joinedmember;
  String deadline;

  ShowPoolModel.fromJson(Map<String, dynamic> json)
      : poolid = json['poolid'],
        poolname = json['poolname'],
        poolowner = json['poolowner'],
        poolamount = json['poolamount'],
        maxmember = json['maxmember'],
        joinedmember = json['joinedmember'],
        deadline = json['deadline'];
}
