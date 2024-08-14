import 'package:json_annotation/json_annotation.dart';
part 'contacts.g.dart';

@JsonSerializable()
class Contacts {
  String? name;
  String? phone;

  Contacts({this.name, this.phone});

  factory Contacts.fromJson(Map<String, dynamic> json) => _$ContactsFromJson(json);
  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}