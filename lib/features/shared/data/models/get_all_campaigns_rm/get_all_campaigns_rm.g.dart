// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_campaigns_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCampaignsRm _$GetAllCampaignsRmFromJson(Map<String, dynamic> json) =>
    GetAllCampaignsRm(
      status: (json['status'] as num?)?.toInt(),
      error: json['error'],
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllCampaignsRmToJson(GetAllCampaignsRm instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'data': instance.data,
    };
