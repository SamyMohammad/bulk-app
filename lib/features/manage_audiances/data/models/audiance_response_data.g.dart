// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audiance_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudiencesListData _$AudiencesListDataFromJson(Map<String, dynamic> json) =>
    AudiencesListData(
      audiences: (json['audiences'] as List<dynamic>?)
          ?.map((e) => Audience.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AudiencesListDataToJson(AudiencesListData instance) =>
    <String, dynamic>{
      'audiences': instance.audiences,
    };

AudienceData _$AudienceDataFromJson(Map<String, dynamic> json) => AudienceData(
      audience: json['audience'] == null
          ? null
          : Audience.fromJson(json['audience'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudienceDataToJson(AudienceData instance) =>
    <String, dynamic>{
      'audience': instance.audience,
    };
