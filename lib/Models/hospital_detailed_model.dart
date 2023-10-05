// To parse this JSON data, do
//
//     final hospitalDetailedModel = hospitalDetailedModelFromJson(jsonString);

import 'dart:convert';

List<HospitalDetailedModel> hospitalDetailedModelFromJson(String str) => List<HospitalDetailedModel>.from(json.decode(str).map((x) => HospitalDetailedModel.fromJson(x)));

String hospitalDetailedModelToJson(List<HospitalDetailedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalDetailedModel {
  int? id;
  String? name;
  String? nameEn;
  String? phone;
  String? address;
  String? details;
  String? detailsEn;
  String? area;
  String? areaEn;
  String? profile;
  List<String>? image;
  String? mapImage;
  String? locationLon;
  String? locationLat;
  int? rate;
  int? xray;
  int? lab;
  int? doctors;
  int? specCount;

  HospitalDetailedModel({
    this.id,
    this.name,
    this.nameEn,
    this.phone,
    this.address,
    this.details,
    this.detailsEn,
    this.area,
    this.areaEn,
    this.profile,
    this.image,
    this.mapImage,
    this.locationLon,
    this.locationLat,
    this.rate,
    this.xray,
    this.lab,
    this.doctors,
    this.specCount,
  });

  factory HospitalDetailedModel.fromJson(Map<String, dynamic> json) => HospitalDetailedModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    phone: json["phone"],
    address: json["address"],
    details: json["details"],
    detailsEn: json["details_en"],
    area: json["area"],
    areaEn: json["area_en"],
    profile: json["profile"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    mapImage: json["map_image"],
    locationLon: "${json["location_lon"]}",
    locationLat: "${json["location_lat"]}",
    rate: json["rate"],
    xray: json["xray"],
    lab: json["lab"],
    doctors: json["doctors"],
    specCount: json["spec_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "phone": phone,
    "address": address,
    "details": details,
    "details_en": detailsEn,
    "area": area,
    "area_en": areaEn,
    "profile": profile,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "map_image": mapImage,
    "location_lon": locationLon,
    "location_lat": locationLat,
    "rate": rate,
    "xray": xray,
    "lab": lab,
    "doctors": doctors,
    "spec_count": specCount,
  };
}