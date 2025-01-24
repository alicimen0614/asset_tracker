import 'package:json_annotation/json_annotation.dart';
import 'direction_model.dart';

part 'asset_model.g.dart';

@JsonSerializable()
class Asset {
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: '')
  final String alis;
  @JsonKey(defaultValue: '')
  final String satis;
  @JsonKey(defaultValue: '')
  final String tarih;
  final Direction? dir;
  final double? dusuk;
  final double? yuksek;
  final double? kapanis;

  Asset({
    required this.code,
    required this.alis,
    required this.satis,
    required this.tarih,
    this.dir,
    this.dusuk,
    this.yuksek,
    this.kapanis,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);
}
