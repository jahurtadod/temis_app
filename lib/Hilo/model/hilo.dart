import 'dart:convert';

Hilo hiloFromJson(String str) => Hilo.fromJson(json.decode(str));

String hiloToJson(Hilo data) => json.encode(data.toJson());

class Hilo {
  String title;
  String description;
  List<Route> route;

  Hilo({
    this.title,
    this.description,
    this.route,
  });

  factory Hilo.fromJson(Map<String, dynamic> json) => Hilo(
        title: json["title"],
        description: json["description"],
        route: List<Route>.from(json["route"].map((x) => Route.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "route": List<dynamic>.from(route.map((x) => x.toJson())),
      };
}

class Route {
  String role;
  List<Event> event;

  Route({
    this.role,
    this.event,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        role: json["role"],
        event: List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "event": List<dynamic>.from(event.map((x) => x.toJson())),
      };
}

class Event {
  int id;
  String text;
  String role;
  int next;
  List<Option> option;
  Judgment judgment;

  Event({
    this.id,
    this.text,
    this.role,
    this.next,
    this.option,
    this.judgment,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        text: json["text"] == null ? null : json["text"],
        role: json["role"],
        next: json["next"] == null ? null : json["next"],
        option: json["option"] == null
            ? null
            : List<Option>.from(json["option"].map((x) => Option.fromJson(x))),
        judgment: json["judgment"] == null
            ? null
            : Judgment.fromJson(json["judgment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text == null ? null : text,
        "role": role,
        "next": next == null ? null : next,
        "option": option == null
            ? null
            : List<dynamic>.from(option.map((x) => x.toJson())),
        "judgment": judgment == null ? null : judgment.toJson(),
      };
}

class Judgment {
  String resolution;
  String description;

  Judgment({
    this.resolution,
    this.description,
  });

  factory Judgment.fromJson(Map<String, dynamic> json) => Judgment(
        resolution: json["resolution"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "resolution": resolution,
        "description": description,
      };
}

class Option {
  String text;
  int next;

  Option({
    this.text,
    this.next,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        text: json["text"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "next": next,
      };
}
