

import 'dart:convert';

List<HospitalDoctorData> hospitalDoctorDataFromJson(String str) => List<HospitalDoctorData>.from(json.decode(str).map((x) => HospitalDoctorData.fromJson(x)));

String hospitalDoctorDataToJson(List<HospitalDoctorData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalDoctorData {
  int? id;
  String? name;
  String? nameEn;
  String? image;
  String? specialist;
  String? specialistEn;

  HospitalDoctorData({
    this.id,
    this.name,
    this.nameEn,
    this.image,
    this.specialist,
    this.specialistEn,
  });

  factory HospitalDoctorData.fromJson(Map<String, dynamic> json) => HospitalDoctorData(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    image: json["image"],
    specialist: json["specialist"],
    specialistEn: json["specialist_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "image": image,
    "specialist": specialist,
    "specialist_en": specialistEn,
  };
}
