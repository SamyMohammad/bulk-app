// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      message: json['message'] as String?,
      file: json['file'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deletedAt: json['deleted_at'],
      userId: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'message': instance.message,
      'file': instance.file,
      'created_at': instance.createdAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'user_id': instance.userId,
    };
