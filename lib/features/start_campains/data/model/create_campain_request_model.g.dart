// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_campain_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCampainRequestBody _$CreateCampainRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateCampainRequestBody(
      templateId: (json['templateId'] as num?)?.toInt(),
      audienceId: (json['audienceId'] as num?)?.toInt(),
      accountId: (json['accountId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateCampainRequestBodyToJson(
        CreateCampainRequestBody instance) =>
    <String, dynamic>{
      'templateId': instance.templateId,
      'audienceId': instance.audienceId,
      'accountId': instance.accountId,
    };
