import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'toggle_campaign_rm.g.dart';

@JsonSerializable()
class ToggleCampaignRm {
  int? status;
  dynamic error;
  Data? data;

  ToggleCampaignRm({this.status, this.error, this.data});

  factory ToggleCampaignRm.fromJson(Map<String, dynamic> json) {
    return _$ToggleCampaignRmFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ToggleCampaignRmToJson(this);
}
