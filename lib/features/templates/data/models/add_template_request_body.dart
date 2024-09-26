import 'package:json_annotation/json_annotation.dart';
part 'add_template_request_body.g.dart';

@JsonSerializable()
class AddTemplateRequestBody {
  final String name;
  final String message;
  final String file;

  AddTemplateRequestBody(
      {required this.name, required this.message, required this.file});

  Map<String, dynamic> toJson() => _$AddTemplateRequestBodyToJson(this);
}

@JsonSerializable()
class UpdateTemplateRequestBody extends AddTemplateRequestBody {
  final int id;

  UpdateTemplateRequestBody(
      {required this.id,
      required super.name,
      required super.message,
      required super.file});

  @override
  Map<String, dynamic> toJson() => _$UpdateTemplateRequestBodyToJson(this);
}
