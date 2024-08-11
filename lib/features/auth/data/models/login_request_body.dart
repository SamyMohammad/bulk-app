import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginAndRegisterRequestBody{
  final String email;
  final String password;
  final String spamCheck ;
  final String? type;

  LoginAndRegisterRequestBody( {required this.email, required this.password,required this.spamCheck, this.type});

  Map<String, dynamic> toJson() => _$LoginAndRegisterRequestBodyToJson(this);
}