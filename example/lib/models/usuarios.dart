// To parse this JSON data, do
//
//     final usuarios = usuariosFromJson(jsonString);

import 'dart:convert';

List<Usuarios> usuariosFromJson(String str) =>
    List<Usuarios>.from(json.decode(str).map((x) => Usuarios.fromJson(x)));

String usuariosToJson(List<Usuarios> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuarios {
  static const boxName = 'usuarios';

  String codigo;

  String nombreUsuario;

  String email;

  String password;

  String esAdmin;

  Usuarios({
    required this.codigo,
    required this.nombreUsuario,
    required this.email,
    required this.password,
    required this.esAdmin,
  });
  factory Usuarios.fromJson(Map<String, dynamic> json) => Usuarios(
        codigo: json["codigo"],
        nombreUsuario: json["nombreUsuario"],
        email: json["email"],
        password: json["password"],
        esAdmin: json["esAdmin"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombreUsuario": nombreUsuario,
        "email": email,
        "password": password,
        "esAdmin": esAdmin,
      };
}
