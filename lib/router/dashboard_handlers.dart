import 'package:app_admin_dashboard/provider/auth_provider.dart';
import 'package:app_admin_dashboard/ui/views/dashboard_view.dart';
import 'package:app_admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {
      final authprovider = Provider.of<AuthProvider>(context!);
      if (authprovider.authStatus == AuthStatus.authenticated) {
        return const DashboardView();
      } else {
        return const LoginView();
      }
    },
  );
}
