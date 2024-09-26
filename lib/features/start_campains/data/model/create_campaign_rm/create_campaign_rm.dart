import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'create_campaign_rm.g.dart';

@JsonSerializable()
class CreateCampaignRm {
  int? status;
  dynamic error;
  Data? data;

  CreateCampaignRm({this.status, this.error, this.data});

  factory CreateCampaignRm.fromJson(Map<String, dynamic> json) {
    return _$CreateCampaignRmFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateCampaignRmToJson(this);
}
