import 'package:auto_route/auto_route.dart';
import 'package:knocard_ui/presentation/home/home_page.dart';
import 'package:knocard_ui/presentation/splash_screen.dart';
import 'package:knocard_ui/presentation/unknown_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true, path: '/:userName'),
    AutoRoute(page: HomePage),
    AutoRoute(page: UnknownScreen)
  ],
)
class $AppRouter {}
