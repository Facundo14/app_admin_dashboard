import 'package:app_admin_dashboard/provider/auth_provider.dart';
import 'package:app_admin_dashboard/provider/sidemenu_provider.dart';
import 'package:app_admin_dashboard/router/router.dart';
import 'package:app_admin_dashboard/ui/views/icon_view.dart';
import 'package:app_admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class IconsHandlers {
  static Handler icons = Handler(
    handlerFunc: (context, params) {
      final authprovider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrtenPageUrl(Flurorouter.iconsRoute);
      if (authprovider.authStatus == AuthStatus.authenticated) {
        return const IconView();
      } else {
        return const LoginView();
      }
    },
  );
}
