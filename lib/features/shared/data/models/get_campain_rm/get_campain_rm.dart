import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_campain_rm.g.dart';

@JsonSerializable()
class GetCampainRm {
  int? status;
  dynamic error;
  Data? data;

  GetCampainRm({this.status, this.error, this.data});

  factory GetCampainRm.fromJson(Map<String, dynamic> json) {
    return _$GetCampainRmFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCampainRmToJson(this);
}
