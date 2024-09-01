// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contacts _$ContactsFromJson(Map<String, dynamic> json) => Contacts(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ContactsToJson(Contacts instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
    };
