import 'poolDataModel.dart';

class PoolListModel {
  final List<PoolDataModel> poolDataModel;

  PoolListModel({this.poolDataModel});

  factory PoolListModel.fromJson(List<dynamic> parsedJson) {
    List<PoolDataModel> list = List<PoolDataModel>();
    list = parsedJson.map((e) => PoolDataModel.fromJson(e)).toList();

    return PoolListModel(
      poolDataModel: list,
    );
  }
}
