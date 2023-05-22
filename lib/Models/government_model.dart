import 'dart:convert';

List<GovernmentModel> governmentModelFromJson(String str) => List<GovernmentModel>.from(json.decode(str).map((x) => GovernmentModel.fromJson(x)));

String governmentModelToJson(List<GovernmentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GovernmentModel {
  int? id;
  String? name;
  String? nameEn;

  GovernmentModel({
    this.id,
    this.name,
    this.nameEn,
  });

  factory GovernmentModel.fromJson(Map<String, dynamic> json) => GovernmentModel(
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
