// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audiance_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudienceResponseData _$AudienceResponseDataFromJson(
        Map<String, dynamic> json) =>
    AudienceResponseData(
      audiences: (json['audiences'] as List<dynamic>?)
          ?.map((e) => Audiences.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AudienceResponseDataToJson(
        AudienceResponseData instance) =>
    <String, dynamic>{
      'audiences': instance.audiences,
    };
