// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountToken _$AccountTokenFromJson(Map<String, dynamic> json) => AccountToken(
      id: (json['id'] as num?)?.toInt(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AccountTokenToJson(AccountToken instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
    };
