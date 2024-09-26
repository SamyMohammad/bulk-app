import 'package:bulk_app/features/manage_audiances/data/models/contacts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audience.g.dart';

@JsonSerializable()
class Audience {
  int? id;
  String? name;
  List<Contact>? contacts;
  String? createdAt;
  dynamic deletedAt;
  int? userId;

  Audience({
    this.id,
    this.name,
    this.contacts,
    this.createdAt,
    this.deletedAt,
    this.userId,
  });

  factory Audience.fromJson(Map<String, dynamic> json) =>
      _$AudienceFromJson(json);
  Map<String, dynamic> toJson() => _$AudienceToJson(this);
}
