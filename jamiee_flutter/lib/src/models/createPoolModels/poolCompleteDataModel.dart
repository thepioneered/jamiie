import 'poolMemberModel.dart';

class PoolCompleteDataModel {
  List<PeopleJoinedPools> peopleJoinedPool;

  PoolCompleteDataModel({this.peopleJoinedPool});

  PoolCompleteDataModel.fromJson(Map<String, dynamic> json)
      : peopleJoinedPool = json['peopleJoinedPool'];



  Map<String, dynamic> toJson() => {
        'peopleJoinedPool': peopleJoinedPool,
      };
}
