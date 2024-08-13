import 'package:bulk_app/features/manage_audiances/models/contacts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audiences.g.dart';

@JsonSerializable()
class Audiences {
  int? id;
  String? name;
  List<Contacts>? contacts;
  String? created_at;
  dynamic deleted_at;
  int? user_id;

  Audiences({
    this.id,
    this.name,
    this.contacts,
    this.created_at,
    this.deleted_at,
    this.user_id,
  });

  factory Audiences.fromJson(Map<String, dynamic> json) =>
      _$AudiencesFromJson(json);
  Map<String, dynamic> toJson() => _$AudiencesToJson(this);
}
