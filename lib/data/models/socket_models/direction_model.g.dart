// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Direction _$DirectionFromJson(Map<String, dynamic> json) => Direction(
      alisDir: json['alis_dir'] as String? ?? '',
      satisDir: json['satis_dir'] as String? ?? '',
    );

Map<String, dynamic> _$DirectionToJson(Direction instance) => <String, dynamic>{
      'alis_dir': instance.alisDir,
      'satis_dir': instance.satisDir,
    };
