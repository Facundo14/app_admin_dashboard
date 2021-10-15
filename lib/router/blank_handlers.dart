import 'package:app_admin_dashboard/provider/auth_provider.dart';
import 'package:app_admin_dashboard/provider/sidemenu_provider.dart';
import 'package:app_admin_dashboard/router/router.dart';
import 'package:app_admin_dashboard/ui/views/blank_view.dart';
import 'package:app_admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class BlankHandlers {
  static Handler blank = Handler(
    handlerFunc: (context, params) {
      final authprovider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrtenPageUrl(Flurorouter.blankRoute);
      if (authprovider.authStatus == AuthStatus.authenticated) {
        return const BlankView();
      } else {
        return const LoginView();
      }
    },
  );
}
