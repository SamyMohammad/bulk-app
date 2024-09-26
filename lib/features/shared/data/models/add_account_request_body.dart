class AddAccountRequestBody {
  String? name;
  String? phone;

  AddAccountRequestBody({this.name, this.phone});

  AddAccountRequestBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
