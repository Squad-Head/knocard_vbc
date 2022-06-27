import 'package:auto_route/auto_route.dart';
import 'package:knocard_ui/presentation/home/home_page.dart';
import 'package:knocard_ui/presentation/splash_screen.dart';
import 'package:knocard_ui/presentation/unknown_screen.dart';
import 'package:knocard_ui/presentation/username_not_found.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(initial: true, page: SplashScreen, path: '/:userName'),
    AutoRoute(page: HomePage),
    AutoRoute(
      page: UnknownScreen,
    ),
    AutoRoute(page: UserNameNotFoundPage)
  ],
)
class $AppRouter {}
