
import 'dart:convert';

List<HealthInsuranceModel> healthInsuranceModelFromJson(String str) => List<HealthInsuranceModel>.from(json.decode(str).map((x) => HealthInsuranceModel.fromJson(x)));

String healthInsuranceModelToJson(List<HealthInsuranceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HealthInsuranceModel {
  int? id;
  String? insurance;
  String? card;

  HealthInsuranceModel({
    this.id,
    this.insurance,
    this.card,
  });

  factory HealthInsuranceModel.fromJson(Map<String, dynamic> json) => HealthInsuranceModel(
    id: json["id"],
    insurance: json["insurance"],
    card: json["card"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "insurance": insurance,
    "card": card,
  };
}
