import 'package:app_admin_dashboard/api/cafe_api.dart';
import 'package:app_admin_dashboard/models/category_model.dart';
import 'package:app_admin_dashboard/models/http/categories_response.dart';
import 'package:app_admin_dashboard/services/notifications_service.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);

    categorias = [...categoriesResponse.categorias];

    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {
      'nombre': name,
    };

    try {
      final json = await CafeApi.post('/categorias', data);
      final newCategory = Categoria.fromMap(json);

      categorias.add(newCategory);
      notifyListeners();
      NotificationsService.showSnackbarError('Categoria agregada correctamente');
    } catch (e) {
      NotificationsService.showSnackbarError('Error al agregar la categoria');
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {
      'id': id,
      'nombre': name,
    };

    try {
      await CafeApi.put('/categorias/$id', data);

      categorias = categorias.map(
        (c) {
          if (c.id != id) return c;
          c.nombre = name;
          return c;
        },
      ).toList();

      notifyListeners();
      NotificationsService.showSnackbarError('Categoria actualizada correctamente');
    } catch (e) {
      NotificationsService.showSnackbarError('Error al actualizar la categoria');
    }
  }

  Future deleteCategory(String id, String name) async {
    try {
      await CafeApi.delete('/categorias/$id', {});

      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
      NotificationsService.showSnackbarError('Categoria eliminada');
    } catch (e) {
      NotificationsService.showSnackbarError('Error al eliminar la categoria');
    }
  }
}
