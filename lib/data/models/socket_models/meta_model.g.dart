// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      time: (json['time'] as num?)?.toInt() ?? 0,
      tarih: json['tarih'] as String? ?? '',
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'time': instance.time,
      'tarih': instance.tarih,
    };
