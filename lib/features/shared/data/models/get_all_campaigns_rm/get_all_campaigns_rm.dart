import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_campaigns_rm.g.dart';

@JsonSerializable()
class GetAllCampaignsRm {
  int? status;
  dynamic error;
  Data? data;

  GetAllCampaignsRm({this.status, this.error, this.data});

  factory GetAllCampaignsRm.fromJson(Map<String, dynamic> json) {
    return _$GetAllCampaignsRmFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllCampaignsRmToJson(this);
}
