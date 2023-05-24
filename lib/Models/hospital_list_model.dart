import 'dart:convert';

List<HospitalListModel> hospitalListModelFromJson(String str) => List<HospitalListModel>.from(json.decode(str).map((x) => HospitalListModel.fromJson(x)));

String hospitalListModelToJson(List<HospitalListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalListModel {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? area;
  String? areaEn;
  String? image;
  String? locationLon;
  String? locationLat;

  HospitalListModel({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.area,
    this.areaEn,
    this.image,
    this.locationLon,
    this.locationLat,
  });

  factory HospitalListModel.fromJson(Map<String, dynamic> json) => HospitalListModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    area: json["area"],
    areaEn: json["area_en"],
    image: json["image"],
    locationLon: json["location_lon"],
    locationLat: json["location_lat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "address": address,
    "area": area,
    "area_en": areaEn,
    "image": image,
    "location_lon": locationLon,
    "location_lat": locationLat,
  };
}