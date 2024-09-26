import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_account_by_id_rm.g.dart';

@JsonSerializable()
class GetAccountByIdRm {
  int? status;
  dynamic error;
  Data? data;

  GetAccountByIdRm({this.status, this.error, this.data});

  factory GetAccountByIdRm.fromJson(Map<String, dynamic> json) {
    return _$GetAccountByIdRmFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAccountByIdRmToJson(this);
}
