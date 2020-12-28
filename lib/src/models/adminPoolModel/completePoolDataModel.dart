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
  bool startStatus;
  bool completeStatus;

  CompletePoolDataModel(
      {this.poolId,
      this.poolOwner,
      this.poolName,
      this.contributionAmount,
      this.joinedMember,
      this.createdAt,
      this.deadline,
      this.members,
      this.poolType,
      this.totalMember,
      this.completeStatus,
      this.startStatus});

  factory CompletePoolDataModel.formJson(Map<String, dynamic> json) {
    List<MemberModel> list = List<MemberModel>();
    List<dynamic> jsonList = json["joinedpool"];

    //   "joinedpool": [
    //   {
    //     "id": 10,
    //     "memberId": {
    //       "image":
    //           "https://jamiie-userprofile-images.s3.amazonaws.com/ProfileImages/917071006000.jpg",
    //       "phone": "+917071006000",
    //       "name": "Nakul Garg"
    //     },
    //     "joinedAt": "2020-08-29T10:03:02.109723Z",
    //     "poolId": "05797de5"
    //   },
    //   {
    //     "id": 10,
    //     "memberId": {
    //       "image":
    //           "https://jamiie-userprofile-images.s3.amazonaws.com/ProfileImages/917071006000.jpg",
    //       "phone": "+917071006000",
    //       "name": "Nakul Garg"
    //     },
    //     "joinedAt": "2020-08-29T10:03:02.109723Z",
    //     "poolId": "05797de5"
    //   },
    // ]

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
        startStatus: json["startStatus"],
        completeStatus: json["completeStatus"]);
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
  int riskScore;

  MemberDetails({this.imageURL, this.name, this.phone, this.riskScore});

  factory MemberDetails.formJson(Map<String, dynamic> json) {
    List a = json["riskStatus"] as List;
    print("+++++++++++++++++++++++++++++++++++$a+++++++++++++++++++++++");

    print(a[0]);

    return MemberDetails(
      name: json["name"],
      imageURL: json["image"],
      phone: json["phone"],
      riskScore: json["riskStatus"][0]["riskScore"],
    );
  }
}

//TODO:

// class CompletePoolDataModel {
//   CompletePoolDataModel({
//     this.poolId,
//     this.poolOwner,
//     this.poolName,
//     this.contributionAmount,
//     this.joinedMember,
//     this.poolType,
//     this.totalMember,
//     this.createdAt,
//     this.deadline,
//     this.joinedpool,
//     this.startStatus,
//     this.completeStatus,
//   });

//   String poolId;
//   String poolOwner;
//   String poolName;
//   int contributionAmount;
//   int joinedMember;
//   String poolType;
//   int totalMember;
//   String createdAt;
//   String deadline;
//   List<Joinedpool> joinedpool;
//   bool startStatus;
//   bool completeStatus;

//   factory CompletePoolDataModel.fromJson(Map<String, dynamic> json) {
//     return CompletePoolDataModel(
//       poolId: json["poolId"],
//       poolOwner: json["poolOwner"],
//       poolName: json["poolName"],
//       contributionAmount: json["contributionAmount"],
//       joinedMember: json["joinedMember"],
//       poolType: json["poolType"],
//       totalMember: json["totalMember"],
//       createdAt: json["createdAt"],
//       deadline: json["deadline"],
//       joinedpool: List<Joinedpool>.from(
//           json["joinedpool"].map((x) => Joinedpool.fromJson(x))),
//       startStatus: json["startStatus"],
//       completeStatus: json["completeStatus"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "poolId": poolId,
//         "poolOwner": poolOwner,
//         "poolName": poolName,
//         "contributionAmount": contributionAmount,
//         "joinedMember": joinedMember,
//         "poolType": poolType,
//         "totalMember": totalMember,
//         "createdAt": createdAt,
//         "deadline": deadline,
//         "joinedpool": List<dynamic>.from(joinedpool.map((x) => x.toJson())),
//         "startStatus": startStatus,
//         "completeStatus": completeStatus,
//       };
// }

// class Joinedpool {
//   Joinedpool({
//     this.id,
//     this.memberId,
//     this.joinedAt,
//     this.sequence,
//     this.owner,
//     this.poolId,
//   });

//   int id;
//   MemberId memberId;
//   DateTime joinedAt;
//   int sequence;
//   bool owner;
//   String poolId;

//   factory Joinedpool.fromJson(Map<String, dynamic> json) => Joinedpool(
//         id: json["id"],
//         memberId: MemberId.fromJson(json["memberId"]),
//         joinedAt: DateTime.parse(json["joinedAt"]),
//         sequence: json["sequence"],
//         owner: json["owner"],
//         poolId: json["poolId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "memberId": memberId.toJson(),
//         "joinedAt": joinedAt.toIso8601String(),
//         "sequence": sequence,
//         "owner": owner,
//         "poolId": poolId,
//       };
// }

// class MemberId {
//   MemberId({
//     this.image,
//     this.phone,
//     this.name,
//     this.riskStatus,
//   });

//   String image;
//   String phone;
//   String name;
//   List<RiskStatus> riskStatus;

//   factory MemberId.fromJson(Map<String, dynamic> json) => MemberId(
//         image: json["image"],
//         phone: json["phone"],
//         name: json["name"],
//         riskStatus: List<RiskStatus>.from(
//             json["riskStatus"].map((x) => RiskStatus.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "image": image,
//         "phone": phone,
//         "name": name,
//         "riskStatus": List<dynamic>.from(riskStatus.map((x) => x.toJson())),
//       };
// }

// class RiskStatus {
//   RiskStatus({
//     this.phone,
//     this.jobAge,
//     this.family,
//     this.poolingRecord,
//     this.savingReason,
//     this.riskScore,
//     this.riskBand,
//   });

//   String phone;
//   String jobAge;
//   String family;
//   String poolingRecord;
//   String savingReason;
//   int riskScore;
//   String riskBand;

//   factory RiskStatus.fromJson(Map<String, dynamic> json) => RiskStatus(
//         phone: json["phone"],
//         jobAge: json["jobAge"],
//         family: json["family"],
//         poolingRecord: json["poolingRecord"],
//         savingReason: json["savingReason"],
//         riskScore: json["riskScore"],
//         riskBand: json["riskBand"],
//       );

//   Map<String, dynamic> toJson() => {
//         "phone": phone,
//         "jobAge": jobAge,
//         "family": family,
//         "poolingRecord": poolingRecord,
//         "savingReason": savingReason,
//         "riskScore": riskScore,
//         "riskBand": riskBand,
//       };
// }
