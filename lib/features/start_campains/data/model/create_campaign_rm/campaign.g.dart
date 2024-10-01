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
      endedAt: json['ended_at'],
      status: json['status'] as String?,
      audience: json['audience'] == null
          ? null
          : Audience.fromJson(json['audience'] as Map<String, dynamic>),
      template: json['template'] == null
          ? null
          : Template.fromJson(json['template'] as Map<String, dynamic>),
      account: json['account'] == null
          ? null
          : AccountRM.fromJson(json['account'] as Map<String, dynamic>),
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
      'ended_at': instance.endedAt,
      'status': instance.status,
      'audience': instance.audience,
      'template': instance.template,
      'account': instance.account,
    };
