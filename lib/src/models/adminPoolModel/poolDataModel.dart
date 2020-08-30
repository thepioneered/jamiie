class PoolDataModel {
  final String poolName;
  final String poolId;
  final int contributionAmount;
  final int totalMembers;
  final int joinedMembers;
  // final bool status;
  // final String moneyRecieved;
  // final List<ImageModel> imageModel;
  final String poolType;

  PoolDataModel(
      {this.poolName,
      this.poolId,
      this.contributionAmount,
      this.totalMembers,
      this.joinedMembers,
      // this.imageModel,
      // this.moneyRecieved,
      this.poolType});

  factory PoolDataModel.fromJson(Map<String, dynamic> json) {
    // print(json["images"]);
    // List<ImageModel> imageList = List<ImageModel>();
    // List<dynamic> w = json["images"] as List<dynamic>;
    // imageList = w.map((e) => ImageModel.fromJson(e)).toList();

    return PoolDataModel(
      poolName: json["poolName"] as String,
      poolId: json["poolId"] as String,
      contributionAmount: json["contributionAmount"] as int,
      totalMembers: json["totalMember"] as int ,
      joinedMembers: json["joinedMember"] as int,
      // status: json["status"],
      // moneyRecieved: json["moneyRecieved"],
      // imageModel: imageList,
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
