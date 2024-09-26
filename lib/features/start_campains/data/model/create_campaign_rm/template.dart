import 'package:json_annotation/json_annotation.dart';

part 'template.g.dart';

@JsonSerializable()
class Template {
  int? id;
  String? name;
  String? message;
  String? file;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'user_id')
  int? userId;

  Template({
    this.id,
    this.name,
    this.message,
    this.file,
    this.createdAt,
    this.deletedAt,
    this.userId,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return _$TemplateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}
