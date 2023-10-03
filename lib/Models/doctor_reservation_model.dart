import 'dart:convert';

List<DoctorReservationData> doctorReservationDataFromJson(String str) => List<DoctorReservationData>.from(json.decode(str).map((x) => DoctorReservationData.fromJson(x)));

String doctorReservationDataToJson(List<DoctorReservationData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorReservationData {
  int? id;
  String? name;
  String? nameEn;
  int? amount;
  String? image;
  String? locationLon;
  String? locationLat;
  List<Schedule>? schedule;

  DoctorReservationData({
    this.id,
    this.name,
    this.nameEn,
    this.amount,
    this.image,
    this.locationLon,
    this.locationLat,
    this.schedule,
  });

  factory DoctorReservationData.fromJson(Map<String, dynamic> json) => DoctorReservationData(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    amount: json["amount"],
    image: json["image"],
    locationLon: "${json["location_lon"]}",
    locationLat: "${json["location_lat"]}",
    schedule: json["schedule"] == null ? [] : List<Schedule>.from(json["schedule"]!.map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "amount": amount,
    "image": image,
    "location_lon": locationLon,
    "location_lat": locationLat,
    "schedule": schedule == null ? [] : List<dynamic>.from(schedule!.map((x) => x.toJson())),
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
    "date":date,
    "time_from": timeFrom,
    "time_to": timeTo,
  };
}
