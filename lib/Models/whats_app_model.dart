// To parse this JSON data, do
//
//     final whatsAppModel = whatsAppModelFromJson(jsonString);

import 'dart:convert';

List<WhatsAppModel> whatsAppModelFromJson(String str) => List<WhatsAppModel>.from(json.decode(str).map((x) => WhatsAppModel.fromJson(x)));

String whatsAppModelToJson(List<WhatsAppModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WhatsAppModel {
  String? link;

  WhatsAppModel({
    this.link,
  });

  factory WhatsAppModel.fromJson(Map<String, dynamic> json) => WhatsAppModel(
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "link": link,
  };
}
