import 'package:asset_tracker/data/models/socket_models/meta_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'asset_model.dart';

part 'haremaltin_model.g.dart';

@JsonSerializable()
class HaremAltinData {
  final Meta? meta;
  @JsonKey(defaultValue: [])
  final List<Asset> data;

  HaremAltinData({this.meta, required this.data});

  factory HaremAltinData.fromJson(Map<String, dynamic> json) =>
      _$HaremAltinDataFromJson(json);

  Map<String, dynamic> toJson() => _$HaremAltinDataToJson(this);
}
