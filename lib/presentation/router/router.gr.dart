// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:clean_api/clean_api.dart' as _i10;
import 'package:flutter/material.dart' as _i9;

import '../contact/contact_page.dart' as _i4;
import '../contractor_page/business_page.dart' as _i7;
import '../gallery/gallery_page.dart' as _i5;
import '../home/home_page.dart' as _i1;
import '../unknown_screen.dart' as _i2;
import '../username_not_found.dart' as _i3;
import '../videos/videos_page.dart' as _i6;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<HomeRouteArgs>(
          orElse: () => HomeRouteArgs(
              userName: pathParams.getString('userName'),
              shareCode: queryParams.optString('sc')));
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.HomePage(
              key: args.key,
              userName: args.userName,
              shareCode: args.shareCode));
    },
    UnknownRoute.name: (routeData) {
      final args = routeData.argsAs<UnknownRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.UnknownScreen(key: args.key, failure: args.failure));
    },
    UserNameNotFoundRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.UserNameNotFoundPage());
    },
    ContactRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ContactPage());
    },
    GalleryRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GalleryPage());
    },
    VideoRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.VideoPage());
    },
    BusinessRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.BusinessPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: '/:userName', fullMatch: true),
        _i8.RouteConfig(HomeRoute.name, path: '/:userName', children: [
          _i8.RouteConfig(ContactRoute.name,
              path: 'contact', parent: HomeRoute.name),
          _i8.RouteConfig(GalleryRoute.name,
              path: 'gallery', parent: HomeRoute.name),
          _i8.RouteConfig(VideoRoute.name,
              path: 'playlist', parent: HomeRoute.name),
          _i8.RouteConfig(BusinessRoute.name,
              path: 'business', parent: HomeRoute.name)
        ]),
        _i8.RouteConfig(UnknownRoute.name, path: '/unknown-screen'),
        _i8.RouteConfig(UserNameNotFoundRoute.name,
            path: '/user-name-not-found-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<HomeRouteArgs> {
  HomeRoute(
      {_i9.Key? key,
      required String userName,
      String? shareCode,
      List<_i8.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/:userName',
            args: HomeRouteArgs(
                key: key, userName: userName, shareCode: shareCode),
            rawPathParams: {'userName': userName},
            rawQueryParams: {'sc': shareCode},
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.userName, this.shareCode});

  final _i9.Key? key;

  final String userName;

  final String? shareCode;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, userName: $userName, shareCode: $shareCode}';
  }
}

/// generated route for
/// [_i2.UnknownScreen]
class UnknownRoute extends _i8.PageRouteInfo<UnknownRouteArgs> {
  UnknownRoute({_i9.Key? key, required _i10.CleanFailure failure})
      : super(UnknownRoute.name,
            path: '/unknown-screen',
            args: UnknownRouteArgs(key: key, failure: failure));

  static const String name = 'UnknownRoute';
}

class UnknownRouteArgs {
  const UnknownRouteArgs({this.key, required this.failure});

  final _i9.Key? key;

  final _i10.CleanFailure failure;

  @override
  String toString() {
    return 'UnknownRouteArgs{key: $key, failure: $failure}';
  }
}

/// generated route for
/// [_i3.UserNameNotFoundPage]
class UserNameNotFoundRoute extends _i8.PageRouteInfo<void> {
  const UserNameNotFoundRoute()
      : super(UserNameNotFoundRoute.name, path: '/user-name-not-found-page');

  static const String name = 'UserNameNotFoundRoute';
}

/// generated route for
/// [_i4.ContactPage]
class ContactRoute extends _i8.PageRouteInfo<void> {
  const ContactRoute() : super(ContactRoute.name, path: 'contact');

  static const String name = 'ContactRoute';
}

/// generated route for
/// [_i5.GalleryPage]
class GalleryRoute extends _i8.PageRouteInfo<void> {
  const GalleryRoute() : super(GalleryRoute.name, path: 'gallery');

  static const String name = 'GalleryRoute';
}

/// generated route for
/// [_i6.VideoPage]
class VideoRoute extends _i8.PageRouteInfo<void> {
  const VideoRoute() : super(VideoRoute.name, path: 'playlist');

  static const String name = 'VideoRoute';
}

/// generated route for
/// [_i7.BusinessPage]
class BusinessRoute extends _i8.PageRouteInfo<void> {
  const BusinessRoute() : super(BusinessRoute.name, path: 'business');

  static const String name = 'BusinessRoute';
}
