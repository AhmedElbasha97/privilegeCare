import 'dart:convert';

List<ChatLink> chatLinkFromJson(String str) => List<ChatLink>.from(json.decode(str).map((x) => ChatLink.fromJson(x)));

String chatLinkToJson(List<ChatLink> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatLink {
  String? link;

  ChatLink({
    this.link,
  });

  factory ChatLink.fromJson(Map<String, dynamic> json) => ChatLink(
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "link": link,
  };
}
