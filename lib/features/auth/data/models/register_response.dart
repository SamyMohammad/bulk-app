import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterData {
  int? id;
  String? email;

  RegisterData({this.id, this.email});
    factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
      
  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);
}