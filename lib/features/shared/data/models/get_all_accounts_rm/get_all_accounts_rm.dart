import 'package:json_annotation/json_annotation.dart';

import 'account_r_m.dart';

part 'get_all_accounts_rm.g.dart';

@JsonSerializable()
class GetAllAccountsRm {
  List<AccountRM>? accounts;

  GetAllAccountsRm({this.accounts});

  factory GetAllAccountsRm.fromJson(Map<String, dynamic> json) =>
      _$GetAllAccountsRmFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllAccountsRmToJson(this);
}
