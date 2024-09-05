// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Audience _$AudienceFromJson(Map<String, dynamic> json) => Audience(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      deletedAt: json['deletedAt'],
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AudienceToJson(Audience instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contacts': instance.contacts,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'userId': instance.userId,
    };
