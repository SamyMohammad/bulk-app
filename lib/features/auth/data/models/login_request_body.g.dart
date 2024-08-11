// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginAndRegisterRequestBody _$LoginAndRegisterRequestBodyFromJson(
        Map<String, dynamic> json) =>
    LoginAndRegisterRequestBody(
      email: json['email'] as String,
      password: json['password'] as String,
      spamCheck: json['spamCheck'] as String,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$LoginAndRegisterRequestBodyToJson(
        LoginAndRegisterRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'spamCheck': instance.spamCheck,
      'type': instance.type,
    };
