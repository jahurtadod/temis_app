import 'dart:convert';

Hilo hiloFromJson(String str) => Hilo.fromJson(json.decode(str));

String hiloToJson(Hilo data) => json.encode(data.toJson());

class Hilo {
  String nombre;
  String descripcion;
  List<Ruta> ruta;

  Hilo({
    this.nombre,
    this.descripcion,
    this.ruta,
  });

  factory Hilo.fromJson(Map<String, dynamic> json) => Hilo(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        ruta: List<Ruta>.from(json["ruta"].map((x) => Ruta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "ruta": List<dynamic>.from(ruta.map((x) => x.toJson())),
      };
}

class Ruta {
  String nombre;
  String rol;
  List<Dialogo> dialogo;
  List<RutaOpcion> opcion;
  Sentencia sentencia;

  Ruta({
    this.nombre,
    this.rol,
    this.dialogo,
    this.opcion,
    this.sentencia,
  });

  factory Ruta.fromJson(Map<String, dynamic> json) => Ruta(
        nombre: json["nombre"],
        rol: json["rol"],
        dialogo:
            List<Dialogo>.from(json["dialogo"].map((x) => Dialogo.fromJson(x))),
        opcion: List<RutaOpcion>.from(
            json["opcion"].map((x) => RutaOpcion.fromJson(x))),
        sentencia: Sentencia.fromJson(json["sentencia"]),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "rol": rol,
        "dialogo": List<dynamic>.from(dialogo.map((x) => x.toJson())),
        "opcion": List<dynamic>.from(opcion.map((x) => x.toJson())),
        "sentencia": sentencia.toJson(),
      };
}

class Dialogo {
  int id;
  String nombre;
  String descripcion;
  String rol;
  int siguiente;

  Dialogo({
    this.id,
    this.nombre,
    this.descripcion,
    this.rol,
    this.siguiente,
  });

  factory Dialogo.fromJson(Map<String, dynamic> json) => Dialogo(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        rol: json["rol"],
        siguiente: json["siguiente"] == null ? null : json["siguiente"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "rol": rol,
        "siguiente": siguiente == null ? null : siguiente,
      };
}

class RutaOpcion {
  String pregunta;
  List<OpcionOpcion> opcion;

  RutaOpcion({
    this.pregunta,
    this.opcion,
  });

  factory RutaOpcion.fromJson(Map<String, dynamic> json) => RutaOpcion(
        pregunta: json["pregunta"],
        opcion: List<OpcionOpcion>.from(
            json["opcion"].map((x) => OpcionOpcion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pregunta": pregunta,
        "opcion": List<dynamic>.from(opcion.map((x) => x.toJson())),
      };
}

class OpcionOpcion {
  String descripcion;
  int siguiente;

  OpcionOpcion({
    this.descripcion,
    this.siguiente,
  });

  factory OpcionOpcion.fromJson(Map<String, dynamic> json) => OpcionOpcion(
        descripcion: json["descripcion"],
        siguiente: json["siguiente"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "siguiente": siguiente,
      };
}

class Sentencia {
  String resolucion;
  String descripcion;

  Sentencia({
    this.resolucion,
    this.descripcion,
  });

  factory Sentencia.fromJson(Map<String, dynamic> json) => Sentencia(
        resolucion: json["resolucion"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "resolucion": resolucion,
        "descripcion": descripcion,
      };
}
