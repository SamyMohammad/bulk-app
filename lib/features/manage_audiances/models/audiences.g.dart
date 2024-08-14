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
      createdAt: json['created_at'] as String?,
      deletedAt: json['deleted_at'],
      userId: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AudiencesToJson(Audiences instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contacts': instance.contacts,
      'created_at': instance.createdAt,
      'deleted_at': instance.deletedAt,
      'user_id': instance.userId,
    };
