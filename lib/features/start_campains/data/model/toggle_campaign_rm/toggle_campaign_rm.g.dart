// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_campaign_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleCampaignRm _$ToggleCampaignRmFromJson(Map<String, dynamic> json) =>
    ToggleCampaignRm(
      status: (json['status'] as num?)?.toInt(),
      error: json['error'],
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToggleCampaignRmToJson(ToggleCampaignRm instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'data': instance.data,
    };
