import 'dart:typed_data';

import 'package:app_admin_dashboard/api/cafe_api.dart';
import 'package:app_admin_dashboard/models/user_model.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;
  late GlobalKey<FormState> formKey;

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
      img: img ?? user!.img,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future updateUser() async {
    if (!_validForm()) return false;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      await CafeApi.put('/usuarios/${user!.uid}', data);

      return true;
    } catch (e) {
      
      return false;
    }
  }

  Future<Usuario> uploadImage(Uint8List bytes) async {
    try {
      final resp = await CafeApi.uploadFile('/uploads/usuarios/${user!.uid}', bytes);
      user = Usuario.fromMap(resp);
      notifyListeners();
      return user!;
    } catch (e) {
      throw 'Error en user form Provider $e';
    }
  }
}
