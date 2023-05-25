import 'dart:convert';

FavoriteAddedOrNot favoriteAddedOrNotFromJson(String str) => FavoriteAddedOrNot.fromJson(json.decode(str));

String favoriteAddedOrNotToJson(FavoriteAddedOrNot data) => json.encode(data.toJson());

class FavoriteAddedOrNot {
  int? status;

  FavoriteAddedOrNot({
    this.status,
  });

  factory FavoriteAddedOrNot.fromJson(Map<String, dynamic> json) => FavoriteAddedOrNot(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}