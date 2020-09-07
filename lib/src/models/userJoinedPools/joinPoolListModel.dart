class JoinPoolListDataModel {
  int poolAmount;
  int monthlyTotalAmount;
  int amountSaved;
  String poolId;
  String poolName;
  String poolProfile;
  String poolType;
  List<MembersList> membersList;

  JoinPoolListDataModel({
    this.amountSaved,
    this.membersList,
    this.monthlyTotalAmount,
    this.poolAmount,
    this.poolName,
    this.poolProfile,
    this.poolId,
    this.poolType
  });

  factory JoinPoolListDataModel.fromJson(Map<String, dynamic> json) {
    List<MembersList> list = List<MembersList>();
    List<dynamic> jsonmembersList = json["membersList"];
    list = jsonmembersList.map((e) => MembersList.fromJson(e)).toList();

    return JoinPoolListDataModel(
      poolId: json["poolId"],
      amountSaved: json["anountSaved"],
      monthlyTotalAmount: json["monthlyTotalAmount"],
      poolAmount: json["poolAmount"],
      poolName: json["poolName"],
      poolProfile: json["poolProfile"],
      poolType: json["poolType"],
      membersList: list,
    );
  }
}

class MembersList {
  String url;
  String name;
  MembersList({this.url,this.name});
  MembersList.fromJson(Map<String, dynamic> json)
      : url = json["url"],
        name = json["name"];
}

class JoinPoolListModel{
  
  List<JoinPoolListDataModel> joinPoolListDataModel;
  
  JoinPoolListModel({this.joinPoolListDataModel});

  factory JoinPoolListModel.fromJson(Map<String,dynamic> json){
    List<JoinPoolListDataModel> list = List<JoinPoolListDataModel>();
    List<dynamic> jsonList = json["joinPoolListDataModel"];
    list = jsonList.map((e) => JoinPoolListDataModel.fromJson(e)).toList();
    return JoinPoolListModel(
      joinPoolListDataModel: list,
    );
  }
}