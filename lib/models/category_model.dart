import 'dart:convert';

class Categoria {
  Categoria({
    this.id = '',
    this.nombre = '',
    usuario,
  }) : usuario = usuario ?? _Usuario();

  String id;
  String nombre;
  _Usuario usuario;

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["_id"] ?? '',
        nombre: json["nombre"] ?? '',
        usuario: _Usuario.fromMap(json["usuario"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toMap(),
      };
}

class _Usuario {
  _Usuario({
    this.id = '',
    this.nombre = '',
  });

  String id;
  String nombre;

  // ignore: unused_element
  factory _Usuario.fromJson(String str) => _Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Usuario.fromMap(Map<String, dynamic> json) => _Usuario(
        id: json["_id"] ?? '',
        nombre: json["nombre"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
      };
}
