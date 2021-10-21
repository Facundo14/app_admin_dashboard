// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromMap(jsonString);

import 'dart:convert';

import '../user_model.dart';

class UsersResponse {
  UsersResponse({
    this.total = 0,
    usuarios,
  }) : usuarios = usuarios ?? [];

  int total;
  List<Usuario> usuarios;

  factory UsersResponse.fromJson(String str) => UsersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
        total: json["total"] = 0,
        usuarios: List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toMap())),
      };
}
