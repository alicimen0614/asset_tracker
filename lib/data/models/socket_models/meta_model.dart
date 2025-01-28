import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class Meta {
  @JsonKey(defaultValue: 0)
  final int? time;
  @JsonKey(defaultValue: '')
  final String tarih;

  Meta({this.time, required this.tarih});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
