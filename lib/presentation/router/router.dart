import 'package:auto_route/auto_route.dart';
import 'package:knocard_ui/presentation/contact/contact_page.dart';
import 'package:knocard_ui/presentation/contractor_page/business_page.dart';
import 'package:knocard_ui/presentation/gallery/gallery_page.dart';
import 'package:knocard_ui/presentation/home/home_page.dart';
import 'package:knocard_ui/presentation/unknown_screen.dart';
import 'package:knocard_ui/presentation/username_not_found.dart';
import 'package:knocard_ui/presentation/videos/videos_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, path: '/:userName', children: [
      AutoRoute(
        path: 'contact',
        page: ContactPage,
      ),
      AutoRoute(
        path: 'gallery',
        page: GalleryPage,
      ),
      AutoRoute(
        path: 'playlist',
        page: VideoPage,
      ),
      AutoRoute(
        path: 'business',
        page: BusinessPage,
      ),
    ]),
    AutoRoute(
      page: UnknownScreen,
    ),
    AutoRoute(page: UserNameNotFoundPage)
  ],
)
class $AppRouter {}
