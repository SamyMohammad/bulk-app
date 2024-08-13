import 'package:bulk_app/features/manage_audiances/models/audiences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audiance_response_data.g.dart';

@JsonSerializable()
class AudienceResponseData {
  List<Audiences>? audiences;

  AudienceResponseData({this.audiences});

  factory AudienceResponseData.fromJson(Map<String, dynamic> json) =>
      _$AudienceResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$AudienceResponseDataToJson(this);
}
