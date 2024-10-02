// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_campain_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCampainRm _$GetCampainRmFromJson(Map<String, dynamic> json) => GetCampainRm(
      status: (json['status'] as num?)?.toInt(),
      error: json['error'],
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCampainRmToJson(GetCampainRm instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'data': instance.data,
    };
