// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_by_id_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountByIdRm _$GetAccountByIdRmFromJson(Map<String, dynamic> json) =>
    GetAccountByIdRm(
      status: (json['status'] as num?)?.toInt(),
      error: json['error'],
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAccountByIdRmToJson(GetAccountByIdRm instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'data': instance.data,
    };
