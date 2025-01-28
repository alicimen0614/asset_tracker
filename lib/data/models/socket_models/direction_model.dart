import 'package:json_annotation/json_annotation.dart';

part 'direction_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Direction {
  @JsonKey(defaultValue: '')
  final String alisDir;
  @JsonKey(defaultValue: '')
  final String satisDir;

  Direction({required this.alisDir, required this.satisDir});

  factory Direction.fromJson(Map<String, dynamic> json) =>
      _$DirectionFromJson(json);

  Map<String, dynamic> toJson() => _$DirectionToJson(this);
}
