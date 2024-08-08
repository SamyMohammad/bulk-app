// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_template_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTemplateByIdResponse _$GetTemplateByIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetTemplateByIdResponse(
      template: json['template'] == null
          ? null
          : TemplateForUpdate.fromJson(
              json['template'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTemplateByIdResponseToJson(
        GetTemplateByIdResponse instance) =>
    <String, dynamic>{
      'template': instance.template,
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
