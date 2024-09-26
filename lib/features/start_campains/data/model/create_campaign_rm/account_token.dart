import 'package:json_annotation/json_annotation.dart';

part 'account_token.g.dart';

@JsonSerializable()
class AccountToken {
  int? id;
  String? token;

  AccountToken({this.id, this.token});

  factory AccountToken.fromJson(Map<String, dynamic> json) {
    return _$AccountTokenFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountTokenToJson(this);
}
