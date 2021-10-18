import 'package:app_admin_dashboard/provider/auth_provider.dart';
import 'package:app_admin_dashboard/provider/sidemenu_provider.dart';
import 'package:app_admin_dashboard/router/router.dart';
import 'package:app_admin_dashboard/ui/views/categories_view.dart';
import 'package:app_admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class CategoryHandlers {
  static Handler categories = Handler(
    handlerFunc: (context, params) {
      final authprovider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrtenPageUrl(Flurorouter.categoriesRoute);
      if (authprovider.authStatus == AuthStatus.authenticated) {
        return const CategoriesView();
      } else {
        return const LoginView();
      }
    },
  );
}
