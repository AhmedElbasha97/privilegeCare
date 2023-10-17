// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) => List<NotificationModel>.from(json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  int? id;
  String? title;
  String? desc;
  String? titleEn;
  String? descEn;
  String? date;

  NotificationModel({
    this.id,
    this.title,
    this.desc,
    this.titleEn,
    this.descEn,
    this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    title: json["title"],
    desc: json["desc"],
    titleEn: json["title_en"],
    descEn: json["desc_en"],
    date: json["date"] ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
    "title_en": titleEn,
    "desc_en": descEn,
    "date": date,
  };
}


