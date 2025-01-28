// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haremaltin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HaremAltinData _$HaremAltinDataFromJson(Map<String, dynamic> json) =>
    HaremAltinData(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as Map<String, dynamic>?)
              ?.values
              .toList()
              .map(
                (e) => CurrencyModel.fromJson(e),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$HaremAltinDataToJson(HaremAltinData instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
