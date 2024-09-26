import 'package:json_annotation/json_annotation.dart';

import 'campaign.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Campaign>? campaigns;

  Data({this.campaigns});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
