import 'package:json_annotation/json_annotation.dart';

part 'contacts.g.dart';

@JsonSerializable()
class Contacts {
  int? id;
  String? name;
  String? phone;

  Contacts({this.name, this.phone, this.id});

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);
  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}
