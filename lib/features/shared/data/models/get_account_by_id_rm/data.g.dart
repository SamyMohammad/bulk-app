// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      status: json['status'] as String?,
      tokenId: (json['token_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      deletedAt: json['deleted_at'],
      accountToken: json['account_token'] == null
          ? null
          : AccountToken.fromJson(
              json['account_token'] as Map<String, dynamic>),
      accountInfo: json['account_info'] == null
          ? null
          : AccountInfo.fromJson(json['account_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'created_at': instance.createdAt?.toIso8601String(),
      'status': instance.status,
      'token_id': instance.tokenId,
      'user_id': instance.userId,
      'deleted_at': instance.deletedAt,
      'account_token': instance.accountToken,
      'account_info': instance.accountInfo,
    };
