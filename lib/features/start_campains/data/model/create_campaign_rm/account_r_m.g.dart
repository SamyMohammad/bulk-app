// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_r_m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountRM _$AccountRMFromJson(Map<String, dynamic> json) => AccountRM(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      status: json['status'] as String?,
      tokenId: (json['token_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      accountToken: json['account_token'] == null
          ? null
          : AccountToken.fromJson(
              json['account_token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountRMToJson(AccountRM instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'created_at': instance.createdAt?.toIso8601String(),
      'status': instance.status,
      'token_id': instance.tokenId,
      'user_id': instance.userId,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'account_token': instance.accountToken,
    };
