class JoinPoolIdModel {
  String poolId;

  JoinPoolIdModel({this.poolId});

  Map<String, dynamic> toJson(String _mobile) => {
        "poolid": poolId,
        "memberid": _mobile
      };
}
