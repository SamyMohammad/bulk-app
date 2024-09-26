// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) => AccountInfo(
      id: json['id'] as String?,
      sent: (json['sent'] as num?)?.toInt(),
      received: (json['received'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      serverUrl: json['server_url'] as String?,
      accountId: (json['account_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sent': instance.sent,
      'received': instance.received,
      'phone': instance.phone,
      'server_url': instance.serverUrl,
      'account_id': instance.accountId,
    };
