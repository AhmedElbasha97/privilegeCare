import 'dart:convert';

List<DoctorListModel> doctorListModelFromJson(String str) => List<DoctorListModel>.from(json.decode(str).map((x) => DoctorListModel.fromJson(x)));

String doctorListModelToJson(List<DoctorListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorListModel {
  int? id;
  String? name;
  String? nameEn;
  int? waiting;
  int? amount;
  String? image;
  String? hosp;
  String? phone;
  String? locationLon;
  String? locationLat;
  String? details;
  int? listen;
  int? explain;
  int? point;
  double? doctorRate;
  String? level;
  String? levelEn;
  String? specialist;
  String? specialistEn;
  int? visitors;
  List<Schedule>? schedule;

  DoctorListModel({
    this.id,
    this.name,
    this.nameEn,
    this.waiting,
    this.amount,
    this.image,
    this.hosp,
    this.phone,
    this.locationLon,
    this.locationLat,
    this.details,
    this.doctorRate,
    this.listen,
    this.explain,
    this.point,
    this.level,
    this.levelEn,
    this.specialist,
    this.specialistEn,
    this.visitors,
    this.schedule,
  });

  factory DoctorListModel.fromJson(Map<String, dynamic> json) => DoctorListModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    waiting: json["waiting"],
    amount: json["amount"],
    image: json["image"],
    hosp: json["hosp"],
    phone: json["phone"],
    locationLon: json["location_lon"],
    locationLat: json["location_lat"],
    details: json["details"],
    listen: json["listen"],
    explain: json["explain"],
    point: json["point"],
    level: json["level"],
    levelEn: json["level_en"],
    specialist: json["specialist"],
    specialistEn: json["specialist_en"],
    doctorRate: double.parse("${json["doctor_rate"]}"),

    visitors: json["visitors"],
    schedule: json["schedule"] == null ? [] : List<Schedule>.from(json["schedule"]!.map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "waiting": waiting,
    "amount": amount,
    "image": image,
    "hosp": hosp,
    "phone": phone,
    "location_lon": locationLon,
    "location_lat": locationLat,
    "details": details,
    "listen": listen,
    "explain": explain,
    "point": point,
    "level": level,
    "level_en": levelEn,
    "specialist": specialist,
    "specialist_en": specialistEn,
    "visitors": visitors,
    "schedule": schedule == null ? [] : List<dynamic>.from(schedule!.map((x) => x.toJson())),
  };
}

class Schedule {
  int? id;
  DateTime? date;
  String? timeFrom;
  String? timeTo;

  Schedule({
    this.id,
    this.date,
    this.timeFrom,
    this.timeTo,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time_from": timeFrom,
    "time_to": timeTo,
  };
}
