
import 'dart:convert';

List<DoctorHomeModelData> doctorHomeModelDataFromJson(String str) => List<DoctorHomeModelData>.from(json.decode(str).map((x) => DoctorHomeModelData.fromJson(x)));

String doctorHomeModelDataToJson(List<DoctorHomeModelData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorHomeModelData {
  int? id;
  String? name;
  String? nameEn;
  int? amount;
  String? image;
  String? specialist;
  String? specialistEn;

  DoctorHomeModelData({
    this.id,
    this.name,
    this.nameEn,
    this.amount,
    this.image,
    this.specialist,
    this.specialistEn,
  });

  factory DoctorHomeModelData.fromJson(Map<String, dynamic> json) => DoctorHomeModelData(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    amount: json["amount"],
    image: json["image"],
    specialist: json["specialist"],
    specialistEn: json["specialist_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "amount": amount,
    "image": image,
    "specialist": specialist,
    "specialist_en": specialistEn,
  };
}
