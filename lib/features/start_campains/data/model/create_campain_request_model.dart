import 'package:json_annotation/json_annotation.dart';

part 'create_campain_request_model.g.dart';

@JsonSerializable()
class CreateCampainRequestBody {
  final int? templateId;
  final int? audienceId;
  final int? accountId;

  CreateCampainRequestBody(
      {required this.templateId,
      required this.audienceId,
      required this.accountId});

  Map<String, dynamic> toJson() => _$CreateCampainRequestBodyToJson(this);
}
