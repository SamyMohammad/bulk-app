// class Autogenerated {
//   int? id;
//   String? name;
//   List<Contacts>? contacts;

//   Autogenerated({this.id, this.name, this.contacts});

//   Autogenerated.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     if (json['contacts'] != null) {
//       contacts = <Contacts>[];
//       json['contacts'].forEach((v) {
//         contacts!.add(new Contacts.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.contacts != null) {
//       data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Contacts {
//   String? name;
//   String? phone;

//   Contacts({this.name, this.phone});

//   Contacts.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     phone = json['phone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['phone'] = this.phone;
//     return data;
//   }
// }