import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  String? status;
  String? msg;
  String? msgAr;
  Info? info;

  AuthModel({
    this.status,
    this.msg,
    this.msgAr,
    this.info,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    status: json["status"],
    msg: json["msg"],
    msgAr: json["msg_ar"],
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "msg_ar": msgAr,
    "info": info?.toJson(),
  };
}

class Info {
  int? id;
  String? name;
  String? email;

  Info({
    this.id,
    this.name,
    this.email,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
  };
}
