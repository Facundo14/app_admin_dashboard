import 'package:app_admin_dashboard/api/cafe_api.dart';
import 'package:app_admin_dashboard/models/http/users_response.dart';
import 'package:app_admin_dashboard/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&ddesde=0');
    final usersResp = UsersResponse.fromMap(resp);

    users = [...usersResp.usuarios];

    isLoading = false;

    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final resp = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp);

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;
    notifyListeners();
  }

  void refreshUser(Usuario newUser) {
    users = users.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user;
    }).toList();

    notifyListeners();
  }
}
