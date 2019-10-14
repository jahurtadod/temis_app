import 'dart:convert';

List<RouteCurrent> routeCurrentFromJson(String str) => List<RouteCurrent>.from(
    json.decode(str).map((x) => RouteCurrent.fromJson(x)));

String routeCurrentToJson(List<RouteCurrent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RouteCurrent {
  bool type;
  String text;
  String role;

  RouteCurrent({
    this.type,
    this.text,
    this.role,
  });

  factory RouteCurrent.fromJson(Map<String, dynamic> json) => RouteCurrent(
        type: json["type"],
        text: json["text"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
        "role": role,
      };
}
