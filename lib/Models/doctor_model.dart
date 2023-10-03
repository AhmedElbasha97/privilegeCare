import 'dart:convert';

List<DoctorProfile> doctorProfileFromJson(String str) => List<DoctorProfile>.from(json.decode(str).map((x) => DoctorProfile.fromJson(x)));

String doctorProfileToJson(List<DoctorProfile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorProfile {
  int? id;
  String? name;
  String? nameEn;
  int? waiting;
  int? amount;
  String? image;
  String? video;
  String? hosp;
  String? phone;
  String? locationLon;
  String? locationLat;
  String? details;
  String? profile;
  int? listen;
  int? explain;
  int? point;
  String? level;
  String? levelEn;
  String? specialist;
  String? specialistEn;
  int? visitors;
  double? doctorRate;
  double? hospRate;
  List<Schedule?>? schedule;

  DoctorProfile({
    this.id,
    this.name,
    this.nameEn,
    this.waiting,
    this.amount,
    this.image,
    this.video,
    this.hosp,
    this.phone,
    this.locationLon,
    this.locationLat,
    this.details,
    this.profile,
    this.listen,
    this.explain,
    this.point,
    this.level,
    this.levelEn,
    this.specialist,
    this.specialistEn,
    this.visitors,
    this.doctorRate,
    this.hospRate,
    this.schedule,
  });

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => DoctorProfile(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    waiting: json["waiting"],
    amount: json["amount"],
    image: json["image"],
    video: "${json["video"]}",
    hosp: json["hosp"],
    phone: json["phone"],
    locationLon: "${json["location_lon"]}",
    locationLat: "${json["location_lat"]}",
    details: json["details"],
    profile: json["profile"],
    listen: json["listen"],
    explain: json["explain"],
    point: json["point"],
    level: json["level"],
    levelEn: json["level_en"],
    specialist: json["specialist"],
    specialistEn: json["specialist_en"],
    visitors: json["visitors"],
    doctorRate: double.parse("${json["doctor_rate"]}"),
    hospRate: double.parse("${json["hosp_rate"]}"),
    schedule: json["schedule"] == null ? [] : List<Schedule>.from(json["schedule"]!.map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "waiting": waiting,
    "amount": amount,
    "image": image,
    "video": video,
    "hosp": hosp,
    "phone": phone,
    "location_lon": locationLon,
    "location_lat": locationLat,
    "details": details,
    "profile": profile,
    "listen": listen,
    "explain": explain,
    "point": point,
    "level": level,
    "level_en": levelEn,
    "specialist": specialist,
    "specialist_en": specialistEn,
    "visitors": visitors,
    "doctor_rate": doctorRate,
    "hosp_rate": hospRate,
    "schedule": schedule == null ? [] : List<dynamic>.from(schedule!.map((x) => x?.toJson())),

  };
}


class Schedule {
  int? id;
  String? date;
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
    date: json["date"] ,
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "time_from": timeFrom,
    "time_to": timeTo,
  };
}