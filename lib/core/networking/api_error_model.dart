import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "error")
  ErrorData? error;

  ApiErrorModel({
     this.status,
    this.error,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

@JsonSerializable()
class ErrorData {
  String? message;
  String? error;
  List<String>? details;

  ErrorData({this.message, this.error, this.details});

  factory ErrorData.fromJson(Map<String, dynamic> json) => _$ErrorDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}



// @JsonSerializable(genericArgumentFactories: true)
// class BaseResponse<T> {
//   @JsonKey(name: "status")
//   int? status;
//   @JsonKey(name: "error")
//   Error? error;
//   @JsonKey(name: "data")
//   T? data;
//   BaseResponse({this.error, required this.data});
//   factory BaseResponse.fromJson(
//           Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
//       _$BaseResponseFromJson(json, fromJsonT);

//   Map<String, dynamic> toJson(
//           BaseResponse<T> baseResponse, Object Function(T value) toJsonT) =>
//       _$BaseResponseToJson(this, toJsonT);
// }