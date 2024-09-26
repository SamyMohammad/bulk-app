import 'package:bulk_app/features/manage_audiances/data/models/audience.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audiance_response_data.g.dart';

@JsonSerializable()
class AudiencesListData {
  List<Audience>? audiences;

  AudiencesListData({this.audiences});

  factory AudiencesListData.fromJson(Map<String, dynamic> json) =>
      _$AudiencesListDataFromJson(json);

  Map<String, dynamic> toJson() => _$AudiencesListDataToJson(this);
}

@JsonSerializable()
class AudienceData {
  Audience? audience;

  AudienceData({this.audience});

  factory AudienceData.fromJson(Map<String, dynamic> json) =>
      _$AudienceDataFromJson(json);

  Map<String, dynamic> toJson() => _$AudienceDataToJson(this);
}
