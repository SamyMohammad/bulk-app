// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campaign _$CampaignFromJson(Map<String, dynamic> json) => Campaign(
      id: (json['id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      audienceId: (json['audience_id'] as num?)?.toInt(),
      templateId: (json['template_id'] as num?)?.toInt(),
      accountId: (json['account_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      progress: (json['progress'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      endedAt: json['ended_at'] == null
          ? null
          : DateTime.parse(json['ended_at'] as String),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CampaignToJson(Campaign instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'audience_id': instance.audienceId,
      'template_id': instance.templateId,
      'account_id': instance.accountId,
      'user_id': instance.userId,
      'progress': instance.progress,
      'created_at': instance.createdAt?.toIso8601String(),
      'ended_at': instance.endedAt?.toIso8601String(),
      'status': instance.status,
    };
