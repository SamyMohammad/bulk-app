import 'package:json_annotation/json_annotation.dart';

part 'campaign.g.dart';

@JsonSerializable()
class Campaign {
  int? id;
  String? slug;
  @JsonKey(name: 'audience_id')
  int? audienceId;
  @JsonKey(name: 'template_id')
  int? templateId;
  @JsonKey(name: 'account_id')
  int? accountId;
  @JsonKey(name: 'user_id')
  int? userId;
  int? progress;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'ended_at')
  dynamic endedAt;
  String? status;

  Campaign({
    this.id,
    this.slug,
    this.audienceId,
    this.templateId,
    this.accountId,
    this.userId,
    this.progress,
    this.createdAt,
    this.endedAt,
    this.status,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return _$CampaignFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CampaignToJson(this);
}
