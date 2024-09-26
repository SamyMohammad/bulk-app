import 'package:json_annotation/json_annotation.dart';

import 'campaign.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Campaign? campaign;

  Data({this.campaign});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
