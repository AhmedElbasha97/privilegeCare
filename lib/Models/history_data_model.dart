
import 'dart:convert';

List<HistoryDataModel> historyDataModelFromJson(String str) => List<HistoryDataModel>.from(json.decode(str).map((x) => HistoryDataModel.fromJson(x)));

String historyDataModelToJson(List<HistoryDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryDataModel {
  int? id;
  String? status;
  String? diagnosis;
  DateTime? date;
  String? time;
  int? doctorId;
  String? doctor;
  int? point;
  int? review;
  String? spac;
  String? spacEn;
  String? image;

  HistoryDataModel({
    this.id,
    this.status,
    this.diagnosis,
    this.date,
    this.time,
    this.doctorId,
    this.doctor,
    this.point,
    this.review,
    this.spac,
    this.spacEn,
    this.image,
  });

  factory HistoryDataModel.fromJson(Map<String, dynamic> json) => HistoryDataModel(
    id: json["id"],
    status: json["status"],
    diagnosis: json["diagnosis"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    doctorId: json["doctor_id"],
    doctor: json["doctor"],
    point: json["point"],
    review: json["review"],
    spac: json["spac"],
    spacEn: json["spac_en"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "diagnosis": diagnosis,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "doctor_id": doctorId,
    "doctor": doctor,
    "point": point,
    "review": review,
    "spac": spac,
    "spac_en": spacEn,
    "image": image,
  };
}