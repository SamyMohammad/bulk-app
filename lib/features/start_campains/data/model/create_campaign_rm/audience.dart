import 'package:json_annotation/json_annotation.dart';

import 'contact.dart';

part 'audience.g.dart';

@JsonSerializable()
class Audience {
  int? id;
  String? name;
  List<Contact>? contacts;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'deleted_at')
  DateTime? deletedAt;
  @JsonKey(name: 'user_id')
  int? userId;

  Audience({
    this.id,
    this.name,
    this.contacts,
    this.createdAt,
    this.deletedAt,
    this.userId,
  });

  factory Audience.fromJson(Map<String, dynamic> json) {
    return _$AudienceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AudienceToJson(this);
}
