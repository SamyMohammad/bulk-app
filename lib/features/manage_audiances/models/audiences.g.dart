// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audiences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Audiences _$AudiencesFromJson(Map<String, dynamic> json) => Audiences(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contacts.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] as String?,
      deleted_at: json['deleted_at'],
      user_id: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AudiencesToJson(Audiences instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contacts': instance.contacts,
      'created_at': instance.created_at,
      'deleted_at': instance.deleted_at,
      'user_id': instance.user_id,
    };
