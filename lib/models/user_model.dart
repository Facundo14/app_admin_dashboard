import 'dart:convert';

class Usuario {
  Usuario({
    this.rol = '',
    this.estado = false,
    this.google = false,
    this.nombre = '',
    this.correo = '',
    this.uid = '',
    this.img,
  });

  String rol;
  bool estado;
  bool google;
  String nombre;
  String correo;
  String uid;
  String? img;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        rol: json["rol"] ?? '',
        estado: json["estado"] ?? false,
        google: json["google"] ?? false,
        nombre: json["nombre"] ?? '',
        correo: json["correo"] ?? '',
        uid: json["uid"] ?? '',
        img: json["img"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "nombre": nombre,
        "correo": correo,
        "uid": uid,
        "img": img,
      };
}
