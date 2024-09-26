import 'package:json_annotation/json_annotation.dart';

part 'account_info.g.dart';

@JsonSerializable()
class AccountInfo {
  String? id;
  int? sent;
  int? received;
  String? phone;
  @JsonKey(name: 'server_url')
  String? serverUrl;
  @JsonKey(name: 'account_id')
  int? accountId;

  AccountInfo({
    this.id,
    this.sent,
    this.received,
    this.phone,
    this.serverUrl,
    this.accountId,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return _$AccountInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);
}
