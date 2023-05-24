import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  String? name;
  String? review;
  String? datetime;

  CommentModel({
    this.name,
    this.review,
    this.datetime,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    name: json["name"],
    review: json["review"],
    datetime: json["datetime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "datetime": datetime,
  };
}
