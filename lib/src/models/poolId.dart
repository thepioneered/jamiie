class PoolId {
  String poolId;

  PoolId({this.poolId});
}

class PoolIdMobileModel {
  // String poolId;
  // String mobile;

  Map<String, dynamic> toJson(String poolId, String mobile) {
    return {
      "poolId": poolId,
      "phone": mobile,
    };
  }
}
