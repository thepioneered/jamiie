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
  // : id = json["id"],
  //   joinedAt = json["joinedAt"],
  //   sequence = json["sequence"];
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

// class JoinPoolListDataModel {
// int poolAmount;
// int monthlyTotalAmount;
// int amountSaved;
// String poolId;
// String poolName;
// String poolProfile;
// String poolType;
// bool status;
//   List<MembersList> membersList;

//   JoinPoolListDataModel(
//       {this.amountSaved,
//       this.membersList,
//       this.monthlyTotalAmount,
//       this.poolAmount,
//       this.poolName,
//       this.poolProfile,
//       this.poolId,
//       this.poolType,
//       this.status,
//       });

//   factory JoinPoolListDataModel.fromJson(Map<String, dynamic> json) {
//     List<MembersList> list = List<MembersList>();
//     List<dynamic> jsonmembersList = json["membersList"];
//     list = jsonmembersList.map((e) => MembersList.fromJson(e)).toList();

//     return JoinPoolListDataModel(
//       poolId: json["poolId"],
//       amountSaved: json["anountSaved"],
//       monthlyTotalAmount: json["monthlyTotalAmount"],
//       poolAmount: json["poolAmount"],
//       poolName: json["poolName"],
//       poolProfile: json["poolProfile"],
//       poolType: json["poolType"],
//       status: json["status"],
//       membersList: list,
//     );
//   }
// }

// class MembersList {
//   String url;
//   String name;
//   MembersList({this.url, this.name});
//   MembersList.fromJson(Map<String, dynamic> json)
//       : url = json["url"],
//         name = json["name"];
// }

// class JoinPoolListModel{

//   List<JoinPoolListDataModel> joinPoolListDataModel;

//   JoinPoolListModel({this.joinPoolListDataModel});

//   factory JoinPoolListModel.fromJson(Map<String,dynamic> json){
//     List<JoinPoolListDataModel> list = List<JoinPoolListDataModel>();
//     List<dynamic> jsonList = json["joinPoolListDataModel"];
//     list = jsonList.map((e) => JoinPoolListDataModel.fromJson(e)).toList();
//     return JoinPoolListModel(
//       joinPoolListDataModel: list,
//     );
//   }
// }
