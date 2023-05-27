import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  String? name;
  String? review;
  double? doctorRate;
  int? hospitalRate;
  String? datetime;

  CommentModel({
    this.name,
    this.review,
    this.doctorRate,
    this.hospitalRate,
    this.datetime,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    name: json["name"],
    review: json["review"],
    doctorRate: json["doctor_rate"]?.toDouble(),
    hospitalRate: json["hospital_rate"],
    datetime: json["datetime"] ,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "doctor_rate": doctorRate,
    "hospital_rate": hospitalRate,
    "datetime": datetime,
  };
}