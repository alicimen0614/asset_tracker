// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      code: json['code']?.toString() ?? '',
      alis: json['alis']?.toString() ?? '',
      satis: json['satis']?.toString() ?? '',
      tarih: json['tarih']?.toString() ?? '',
      dir: json['dir'] == null
          ? null
          : Direction.fromJson(json['dir'] as Map<String, dynamic>),
      dusuk: (json['dusuk'] as num?)?.toDouble(),
      yuksek: (json['yuksek'] as num?)?.toDouble(),
      kapanis: (json['kapanis'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'alis': instance.alis,
      'satis': instance.satis,
      'tarih': instance.tarih,
      'dir': instance.dir,
      'dusuk': instance.dusuk,
      'yuksek': instance.yuksek,
      'kapanis': instance.kapanis,
    };
