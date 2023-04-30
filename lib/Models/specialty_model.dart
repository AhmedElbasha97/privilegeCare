import 'dart:convert';

List<SpecialistModel> specialistModelFromJson(String str) => List<SpecialistModel>.from(json.decode(str).map((x) => SpecialistModel.fromJson(x)));

String specialistModelToJson(List<SpecialistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpecialistModel {
  int? id;
  String? name;
  String? nameEn;
  String? image;

  SpecialistModel({
    this.id,
    this.name,
    this.nameEn,
    this.image,
  });

  factory SpecialistModel.fromJson(Map<String, dynamic> json) => SpecialistModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "image": image,
  };
}
