class SearchPoolIdModel {
  String poolId;

  SearchPoolIdModel({this.poolId});

  Map<String, dynamic> toJson() => {
        "poolid": poolId,
      };
}
