// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_campaign_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCampaignRm _$CreateCampaignRmFromJson(Map<String, dynamic> json) =>
    CreateCampaignRm(
      status: (json['status'] as num?)?.toInt(),
      error: json['error'],
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCampaignRmToJson(CreateCampaignRm instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'data': instance.data,
    };
