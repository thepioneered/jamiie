class CompletePoolDataModel {
  String poolId;
  String poolOwner;
  String poolName;
  int contributionAmount;
  int joinedMember;
  int totalMember;
  String poolType;
  String deadline;
  String createdAt;
  List<MemberModel> members;

  CompletePoolDataModel({
    this.poolId,
    this.poolOwner,
    this.poolName,
    this.contributionAmount,
    this.joinedMember,
    this.createdAt,
    this.deadline,
    this.members,
    this.poolType,
    this.totalMember,
  });

  factory CompletePoolDataModel.formJson(Map<String, dynamic> json) {
    List<MemberModel> list = List<MemberModel>();
    List<dynamic> jsonList = json["joinedpool"];

    list = jsonList.map((e) => MemberModel.fromJson(e)).toList();

    return CompletePoolDataModel(
      poolId: json["poolId"],
      poolOwner: json["poolOwner"],
      poolName: json["poolName"],
      contributionAmount: json["contributionAmount"],
      joinedMember: json['joinedMember'],
      poolType: json["poolType"],
      totalMember: json['totalMember'],
      createdAt: json["createdAt"],
      deadline: json["deadline"],
      members: list,
    );
  }
}

class MemberModel {
  int memberId;
  String joinedAt;
  MemberDetails memberDetails;

  MemberModel({this.joinedAt, this.memberDetails, this.memberId});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    MemberDetails memberDetails = MemberDetails.formJson(json['memberId']);
    return MemberModel(
      memberId: json["id"],
      joinedAt: json["joinedAt"],
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

var e = {
  "poolId": "05797de5",
  "poolOwner": "+917071006000",
  "poolName": "uffi",
  "contributionAmount": 68,
  "joinedMember": 1,
  "poolType": "Weekly",
  "totalMember": 9,
  "createdAt": "2020-08-29T10:03:02.105398Z",
  "deadline": "2020-09-09",
  "joinedpool": [
    {
      "id": 10,
      "memberId": {
        "image":
            "https://jamiie-userprofile-images.s3.amazonaws.com/ProfileImages/917071006000.jpg",
        "phone": "+917071006000",
        "name": "Nakul Garg"
      },
      "joinedAt": "2020-08-29T10:03:02.109723Z",
      "poolId": "05797de5"
    }
  ]
};
