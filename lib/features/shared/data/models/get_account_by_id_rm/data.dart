import 'package:json_annotation/json_annotation.dart';

import 'account_info.dart';
import 'account_token.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? phone;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  String? status;
  @JsonKey(name: 'token_id')
  int? tokenId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'account_token')
  AccountToken? accountToken;
  @JsonKey(name: 'account_info')
  AccountInfo? accountInfo;

  Data({
    this.id,
    this.name,
    this.phone,
    this.createdAt,
    this.status,
    this.tokenId,
    this.userId,
    this.deletedAt,
    this.accountToken,
    this.accountInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
