// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);

import 'dart:convert';

class AuthResponse {
  AuthResponse({
    usuario,
    this.token = '',
  }) : usuario = usuario ?? Usuario();

  Usuario usuario;
  String token;

  factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
      };
}

class Usuario {
  Usuario({
    this.rol = '',
    this.estado = false,
    this.google = false,
    this.nombre = '',
    this.correo = '',
    this.uid = '',
  });

  String rol;
  bool estado;
  bool google;
  String nombre;
  String correo;
  String uid;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        rol: json["rol"] ?? '',
        estado: json["estado"] ?? false,
        google: json["google"] ?? false,
        nombre: json["nombre"] ?? '',
        correo: json["correo"] ?? '',
        uid: json["uid"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "nombre": nombre,
        "correo": correo,
        "uid": uid,
      };
}
