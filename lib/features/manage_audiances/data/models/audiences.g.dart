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
      createdAt: json['createdAt'] as String?,
      deletedAt: json['deletedAt'],
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AudiencesToJson(Audiences instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contacts': instance.contacts,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'userId': instance.userId,
    };
