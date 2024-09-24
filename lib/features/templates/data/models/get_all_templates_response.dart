import 'package:json_annotation/json_annotation.dart';

part 'get_all_templates_response.g.dart';

@JsonSerializable()
class TemplatesData {
  List<Template>? templates;

  TemplatesData({this.templates});

  factory TemplatesData.fromJson(Map<String, dynamic> json) =>
      _$TemplatesDataFromJson(json);

  Map<String, dynamic> toJson() => _$TemplatesDataToJson(this);
}

@JsonSerializable()
class Template {
  int? id;
  String? name;

  Template({this.id, this.name});

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}

@JsonSerializable()
class TemplateForUpdate extends Template {
  String? message;
  String? file;
  String? createdAt;
  int? userId;

  TemplateForUpdate(
      {this.message,
      this.file,
      this.createdAt,
      this.userId,
      super.id,
      super.name});

  factory TemplateForUpdate.fromJson(Map<String, dynamic> json) =>
      _$TemplateForUpdateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TemplateForUpdateToJson(this);
}
