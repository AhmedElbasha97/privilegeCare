import 'dart:convert';

List<HospitalBannerModel> hospitalBannerModelFromJson(String str) => List<HospitalBannerModel>.from(json.decode(str).map((x) => HospitalBannerModel.fromJson(x)));

String hospitalBannerModelToJson(List<HospitalBannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalBannerModel {
  int? id;
  String? name;
  dynamic nameEn;
  List<String>? image;

  HospitalBannerModel({
    this.id,
    this.name,
    this.nameEn,
    this.image,
  });

  factory HospitalBannerModel.fromJson(Map<String, dynamic> json) => HospitalBannerModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
  };
}
