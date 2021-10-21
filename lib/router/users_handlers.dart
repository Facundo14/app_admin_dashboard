import 'package:app_admin_dashboard/provider/auth_provider.dart';
import 'package:app_admin_dashboard/provider/sidemenu_provider.dart';
import 'package:app_admin_dashboard/router/router.dart';
import 'package:app_admin_dashboard/ui/views/login_view.dart';
import 'package:app_admin_dashboard/ui/views/user_view.dart';
import 'package:app_admin_dashboard/ui/views/users_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class UserHandlers {
  static Handler users = Handler(
    handlerFunc: (context, params) {
      final authprovider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrtenPageUrl(Flurorouter.usersRoute);
      if (authprovider.authStatus == AuthStatus.authenticated) {
        return const UsersView();
      } else {
        return const LoginView();
      }
    },
  );

  static Handler user = Handler(
    handlerFunc: (context, params) {
      final authprovider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrtenPageUrl(Flurorouter.userRoute);
      if (authprovider.authStatus == AuthStatus.authenticated) {
        if (params['uid']?.first != null) {
          return UserView(uid: params['uid']!.first);
        }
        return const UsersView();
      } else {
        return const LoginView();
      }
    },
  );
}
