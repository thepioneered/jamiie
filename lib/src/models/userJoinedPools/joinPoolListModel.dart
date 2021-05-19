class JoinPoolListModel {
  List<JoinedPoolListDataModel> joinPoolListDataModel;

  JoinPoolListModel({this.joinPoolListDataModel});

  factory JoinPoolListModel.fromJson(Map<String, dynamic> json) {
    List<JoinedPoolListDataModel> list = List<JoinedPoolListDataModel>();
    List<dynamic> jsonList = json["response"];
    list = jsonList.map((e) => JoinedPoolListDataModel.formJson(e)).toList();

    return JoinPoolListModel(
      joinPoolListDataModel: list,
    );
  }
}

class JoinedPoolListDataModel {
  int id;
  String joinedAt;
  int sequence;
  JoinedPoolListDataSubModel joinedPoolListDataSubModel;

  JoinedPoolListDataModel(
      {this.id, this.joinedAt, this.joinedPoolListDataSubModel, this.sequence});

  factory JoinedPoolListDataModel.formJson(Map<String, dynamic> json) {
    JoinedPoolListDataSubModel joinedPoolListDataSubModel =
        JoinedPoolListDataSubModel.formJson(json["poolId"]);

    return JoinedPoolListDataModel(
      id: json["id"],
      joinedAt: json["joinedAt"],
      sequence: json["sequence"],
      joinedPoolListDataSubModel: joinedPoolListDataSubModel,
    );
  }
}

class JoinedPoolListDataSubModel {
  String poolId;
  String poolName;
  int contributionAmount;
  int joinedMembers;
  String poolType;
  int totalMembers;
  String poolCreatedAt;
  bool status;

  JoinedPoolListDataSubModel.formJson(Map<String, dynamic> json) {
    poolId = json["poolId"];
    poolName = json["poolName"];
    contributionAmount = json["contributionAmount"];
    joinedMembers = json["joinedMember"];
    poolType = json["poolType"];
    totalMembers = json["totalMember"];
    poolCreatedAt = json["createdAt"];
    status = json["startStatus"];
  }
}
