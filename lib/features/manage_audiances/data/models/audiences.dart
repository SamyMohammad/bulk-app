import 'package:bulk_app/features/manage_audiances/data/models/contacts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audiences.g.dart';

@JsonSerializable()
class Audiences {
  int? id;
  String? name;
  List<Contacts>? contacts;
  String? createdAt;
  dynamic deletedAt;
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
