
import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  String? status;
  String? msg;
  String? msgAr;

  ResponseModel({
    this.status,
    this.msg,
    this.msgAr,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    status: json["status"],
    msg: json["msg"],
    msgAr: json["msg_ar"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "msg_ar": msgAr,
  };
}

