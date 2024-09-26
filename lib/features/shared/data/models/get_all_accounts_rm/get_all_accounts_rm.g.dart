// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_accounts_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllAccountsRm _$GetAllAccountsRmFromJson(Map<String, dynamic> json) =>
    GetAllAccountsRm(
      accounts: (json['accounts'] as List<dynamic>?)
          ?.map((e) => AccountRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllAccountsRmToJson(GetAllAccountsRm instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
    };
