import 'dart:convert';

List<HospitalListModel> hospitalListModelFromJson(String str) => List<HospitalListModel>.from(json.decode(str).map((x) => HospitalListModel.fromJson(x)));

String hospitalListModelToJson(List<HospitalListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalListModel {
  int? id;
  String? name;
  String? nameEn;
  String? phone;
  String? address;
  String? details;
  String? detailsEn;
  String? area;
  String? areaEn;
  List<String>? image;
  String? mapImage;
  String? locationLon;
  String? locationLat;

  HospitalListModel({
    this.id,
    this.name,
    this.nameEn,
    this.phone,
    this.address,
    this.details,
    this.detailsEn,
    this.area,
    this.areaEn,
    this.image,
    this.mapImage,
    this.locationLon,
    this.locationLat,
  });

  factory HospitalListModel.fromJson(Map<String, dynamic> json) => HospitalListModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    phone: json["phone"],
    address: json["address"],
    details: json["details"],
    detailsEn: json["details_en"],
    area: json["area"],
    areaEn: json["area_en"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    mapImage: json["map_image"],
    locationLon:"${ json["location_lon"]}",
    locationLat: "${json["location_lat"]}",
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
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "map_image": mapImage,
    "location_lon": locationLon,
    "location_lat": locationLat,
  };
}