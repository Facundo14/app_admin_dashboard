import 'package:app_admin_dashboard/router/blank_handlers.dart';
import 'package:app_admin_dashboard/router/dashboard_handlers.dart';
import 'package:app_admin_dashboard/router/icons_handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:app_admin_dashboard/router/admin_handlers.dart';
import 'package:app_admin_dashboard/router/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  static String rootRoute = '/';
//Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';
// Dashboard
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/icons';
  static String blankRoute = '/blank';

  static void configureRoutes() {
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    //Dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);
    //Icons
    router.define(iconsRoute, handler: IconsHandlers.icons, transitionType: TransitionType.fadeIn);
    //Blank Page
    router.define(blankRoute, handler: BlankHandlers.blank, transitionType: TransitionType.fadeIn);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
