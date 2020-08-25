class JoinPoolIdModel {
  String poolId;

  JoinPoolIdModel({this.poolId});

  Map<String, dynamic> toJson(String _mobile) =>
      {"poolId": poolId, "memberId": _mobile};
}
