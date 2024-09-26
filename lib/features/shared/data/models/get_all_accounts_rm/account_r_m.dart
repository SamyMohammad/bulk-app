import 'package:json_annotation/json_annotation.dart';

part 'account_r_m.g.dart';

@JsonSerializable()
class AccountRM {
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

  AccountRM({
    this.id,
    this.name,
    this.phone,
    this.createdAt,
    this.status,
    this.tokenId,
    this.userId,
    this.deletedAt,
  });

  factory AccountRM.fromJson(Map<String, dynamic> json) {
    return _$AccountRMFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountRMToJson(this);
}
