import 'package:bulk_app/features/templates/data/models/get_all_templates_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_template_by_id_response.g.dart';
@JsonSerializable()
class GetTemplateByIdResponse {
  TemplateForUpdate? template;

  GetTemplateByIdResponse({this.template});

   factory GetTemplateByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTemplateByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTemplateByIdResponseToJson(this);
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