class PoolDataModel {
  final String poolName;
  final String poolId;
  final int contributionAmount;
  final int totalMembers;
  final int joinedMembers;
  final String poolType;

  PoolDataModel(
      {this.poolName,
      this.poolId,
      this.contributionAmount,
      this.totalMembers,
      this.joinedMembers,
      this.poolType});

  factory PoolDataModel.fromJson(Map<String, dynamic> json) {

    return PoolDataModel(
      poolName: json["poolName"] as String,
      poolId: json["poolId"] as String,
      contributionAmount: json["contributionAmount"] as int,
      totalMembers: json["totalMember"] as int ,
      joinedMembers: json["joinedMember"] as int,
      poolType: json["poolType"] as String,
    );
  }
}

class ImageModel {
  String url;
  String name;

  ImageModel.fromJson(Map<String, dynamic> json)
      : url = json["url"],
        name = json["name"];
}
