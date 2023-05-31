import 'dart:convert';

List<PrivacyPolicy> privacyPolicyFromJson(String str) => List<PrivacyPolicy>.from(json.decode(str).map((x) => PrivacyPolicy.fromJson(x)));

String privacyPolicyToJson(List<PrivacyPolicy> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrivacyPolicy {
  String? title;
  String? titleEn;
  String? desc;
  String? descEn;

  PrivacyPolicy({
    this.title,
    this.titleEn,
    this.desc,
    this.descEn,
  });

  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) => PrivacyPolicy(
    title: json["title"],
    titleEn: json["title_en"],
    desc: json["desc"],
    descEn: json["desc_en"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "title_en": titleEn,
    "desc": desc,
    "desc_en": descEn,
  };
}