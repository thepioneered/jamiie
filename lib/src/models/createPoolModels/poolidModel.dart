class PoolIdModel {
  final String poolId;

  PoolIdModel({this.poolId});
  PoolIdModel.fromJson(Map<String, dynamic> json) : poolId = json['poolId'];

  
}
