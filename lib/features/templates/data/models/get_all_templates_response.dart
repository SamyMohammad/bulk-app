import 'package:json_annotation/json_annotation.dart';

part 'get_all_templates_response.g.dart';

@JsonSerializable()
class TemplatesData {
  List<Templates>? templates;

  TemplatesData({this.templates});

  factory TemplatesData.fromJson(Map<String, dynamic> json) =>
      _$TemplatesDataFromJson(json);

  Map<String, dynamic> toJson() => _$TemplatesDataToJson(this);
}

@JsonSerializable()
class Templates {
  int? id;
  String? name;

  Templates({this.id, this.name});

  factory Templates.fromJson(Map<String, dynamic> json) =>
      _$TemplatesFromJson(json);

  Map<String, dynamic> toJson() => _$TemplatesToJson(this);
}