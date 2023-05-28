import 'dart:convert';

List<LevelModel> levelModelFromJson(String str) => List<LevelModel>.from(json.decode(str).map((x) => LevelModel.fromJson(x)));

String levelModelToJson(List<LevelModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LevelModel {
  int? id;
  String? name;
  String? nameEn;

  LevelModel({
    this.id,
    this.name,
    this.nameEn,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
  };
}