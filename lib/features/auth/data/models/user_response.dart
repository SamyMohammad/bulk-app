class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? createdAt;
  Null? lastLogin;
  Null? sessionToken;
  Null? deletedAt;
  String? token;

  User(
      {this.id,
      this.email,
      this.createdAt,
      this.lastLogin,
      this.sessionToken,
      this.deletedAt,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['created_at'];
    lastLogin = json['last_login'];
    sessionToken = json['session_token'];
    deletedAt = json['deleted_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['last_login'] = this.lastLogin;
    data['session_token'] = this.sessionToken;
    data['deleted_at'] = this.deletedAt;
    data['token'] = this.token;
    return data;
  }
}