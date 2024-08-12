// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_templates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplatesData _$TemplatesDataFromJson(Map<String, dynamic> json) =>
    TemplatesData(
      templates: (json['templates'] as List<dynamic>?)
          ?.map((e) => Templates.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TemplatesDataToJson(TemplatesData instance) =>
    <String, dynamic>{
      'templates': instance.templates,
    };

Templates _$TemplatesFromJson(Map<String, dynamic> json) => Templates(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TemplatesToJson(Templates instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TemplateForUpdate _$TemplateForUpdateFromJson(Map<String, dynamic> json) =>
    TemplateForUpdate(
      message: json['message'] as String?,
      file: json['file'] as String?,
      createdAt: json['createdAt'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TemplateForUpdateToJson(TemplateForUpdate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'message': instance.message,
      'file': instance.file,
      'createdAt': instance.createdAt,
      'userId': instance.userId,
    };
