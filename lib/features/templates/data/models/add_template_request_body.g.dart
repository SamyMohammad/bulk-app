// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_template_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTemplateRequestBody _$AddTemplateRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddTemplateRequestBody(
      name: json['name'] as String,
      message: json['message'] as String,
      file: json['file'] as String,
    );

Map<String, dynamic> _$AddTemplateRequestBodyToJson(
        AddTemplateRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'file': instance.file,
    };

UpdateTemplateRequestBody _$UpdateTemplateRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateTemplateRequestBody(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      message: json['message'] as String,
      file: json['file'] as String,
    );

Map<String, dynamic> _$UpdateTemplateRequestBodyToJson(
        UpdateTemplateRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'file': instance.file,
      'id': instance.id,
    };
