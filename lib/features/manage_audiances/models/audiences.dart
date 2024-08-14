import 'package:bulk_app/features/manage_audiances/models/contacts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audiences.g.dart';

@JsonSerializable()
class Audiences {
  int? id;
  String? name;
  List<Contacts>? contacts;
  @JsonKey(name: 'created_at') 
  String? createdAt;
  @JsonKey(name: 'deleted_at') 
  dynamic deletedAt;
  @JsonKey(name: 'user_id') 
  int? userId;

  Audiences({
    this.id,
    this.name,
    this.contacts,
    this.createdAt,
    this.deletedAt,
    this.userId,
  });

  factory Audiences.fromJson(Map<String, dynamic> json) =>
      _$AudiencesFromJson(json);
  Map<String, dynamic> toJson() => _$AudiencesToJson(this);
}
