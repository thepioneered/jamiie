class JoinPoolScreenModel {
  String poolId;
  String poolOwner;
  String poolName;
  int contributionAmount;
  int joinedMember;
  int totalMember;
  String poolType;
  List<MemberModel> members;

  JoinPoolScreenModel({
    this.poolId,
    this.poolOwner,
    this.poolName,
    this.contributionAmount,
    this.joinedMember,
    this.members,
    this.poolType,
    this.totalMember,
  });

  factory JoinPoolScreenModel.formJson(Map<String, dynamic> json) {
    List<MemberModel> list = List<MemberModel>();
    List<dynamic> jsonList = json["membersList"];

    list = jsonList.map((e) => MemberModel.fromJson(e)).toList();

    return JoinPoolScreenModel(
      poolId: json["poolId"],
      poolOwner: json["poolOwner"],
      poolName: json["poolName"],
      contributionAmount: json["contributionAmount"],
      joinedMember: json["joinedMember"],
      poolType: json["poolType"],
      totalMember: json["totalMember"],
      members: list,
    );
  }
}

class MemberModel {
  int memberId;
  MemberDetails memberDetails;

  MemberModel({this.memberDetails, this.memberId});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    MemberDetails memberDetails = MemberDetails.formJson(json["memberId"]);
    return MemberModel(
      memberId: json["id"],
      memberDetails: memberDetails,
    );
  }
}

class MemberDetails {
  String imageURL;
  String phone;
  String name;

  MemberDetails.formJson(Map<String, dynamic> json)
      : imageURL = json["image"],
        phone = json["phone"],
        name = json["name"];
}
