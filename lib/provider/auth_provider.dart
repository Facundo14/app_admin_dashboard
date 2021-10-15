import 'package:app_admin_dashboard/router/router.dart';
import 'package:app_admin_dashboard/services/local_storage.dart';
import 'package:app_admin_dashboard/services/navigaton_service.dart';
import 'package:flutter/cupertino.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO: Peticion http

    _token = 'askdjahskdjahksjdh.654asdasdaa.asd';

    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;

    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: Ir al backend y comprobar si JWT es valido

    await Future.delayed(const Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
