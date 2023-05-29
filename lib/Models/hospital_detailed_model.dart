import 'dart:convert';

List<HospitalDetailedModel> hospitalDetailedModelFromJson(String str) => List<HospitalDetailedModel>.from(json.decode(str).map((x) => HospitalDetailedModel.fromJson(x)));

String hospitalDetailedModelToJson(List<HospitalDetailedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalDetailedModel {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? details;
  String? area;
  String? areaEn;
  String? image;
  String? mapImage;
  String? locationLon;
  String? locationLat;

  HospitalDetailedModel({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.details,
    this.area,
    this.areaEn,
    this.image,
    this.mapImage,
    this.locationLon,
    this.locationLat,
  });

  factory HospitalDetailedModel.fromJson(Map<String, dynamic> json) => HospitalDetailedModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    details: json["details"],
    area: json["area"],
    areaEn: json["area_en"],
    image: json["image"],
    mapImage: json["map_image"],
    locationLon: json["location_lon"],
    locationLat: json["location_lat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "address": address,
    "details": details,
    "area": area,
    "area_en": areaEn,
    "image": image,
    "map_image": mapImage,
    "location_lon": locationLon,
    "location_lat": locationLat,
  };
}