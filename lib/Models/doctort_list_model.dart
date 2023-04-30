import 'dart:convert';

List<DoctorListModel> doctorListModelFromJson(String str) => List<DoctorListModel>.from(json.decode(str).map((x) => DoctorListModel.fromJson(x)));

String doctorListModelToJson(List<DoctorListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorListModel {
  int? id;
  String? name;
  String? nameEn;
  String? image;
  String? hosp;
  String? level;
  String? levelEn;
  String? specialist;
  String? specialistEn;
  List<String>? schedule;

  DoctorListModel({
    this.id,
    this.name,
    this.nameEn,
    this.image,
    this.hosp,
    this.level,
    this.levelEn,
    this.specialist,
    this.specialistEn,
    this.schedule,
  });

  factory DoctorListModel.fromJson(Map<String, dynamic> json) => DoctorListModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    image: json["image"],
    hosp: json["hosp"],
    level: json["level"],
    levelEn: json["level_en"],
    specialist: json["specialist"],
    specialistEn: json["specialist_en"],
    schedule: json["schedule"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "image": image,
    "hosp": hosp,
    "level": level,
    "level_en": levelEn,
    "specialist": specialist,
    "specialist_en": specialistEn,
    "schedule": schedule,
  };
}
