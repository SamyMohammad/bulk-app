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
@JsonSerializable()

class TemplateForUpdate extends Templates {
  String? message;
  String? file;
  String? createdAt;
  int? userId;

  TemplateForUpdate({this.message, this.file, this.createdAt, this.userId, super.id, super.name});

  factory TemplateForUpdate.fromJson(Map<String, dynamic> json) =>
      _$TemplateForUpdateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TemplateForUpdateToJson(this);
}