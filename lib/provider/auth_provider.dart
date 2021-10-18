import 'package:flutter/material.dart';
import 'package:app_admin_dashboard/api/cafe_api.dart';

import 'package:app_admin_dashboard/models/http/auth_response.dart';

import 'package:app_admin_dashboard/router/router.dart';

import 'package:app_admin_dashboard/services/local_storage.dart';
import 'package:app_admin_dashboard/services/navigaton_service.dart';
import 'package:app_admin_dashboard/services/notifications_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    final data = {
      'correo': email,
      'password': password,
    };

    CafeApi.post('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      CafeApi.condifureDio();

      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });
  }

  register(String email, String password, String name) {
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    CafeApi.post('/usuarios', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      CafeApi.condifureDio();

      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);

      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      authStatus = AuthStatus.notAuthenticated;
      NotificationsService.showSnackbarError('JWT no válidos');
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
