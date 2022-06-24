// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../home/home_page.dart' as _i2;
import '../splash_screen.dart' as _i1;
import '../unknown_screen.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () =>
              SplashRouteArgs(userName: pathParams.getString('userName')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(key: args.key, userName: args.userName));
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    UnknownRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.UnknownScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/:userName', fullMatch: true),
        _i4.RouteConfig(SplashRoute.name, path: '/:userName'),
        _i4.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i4.RouteConfig(UnknownRoute.name, path: '/unknown-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({_i5.Key? key, required String userName})
      : super(SplashRoute.name,
            path: '/:userName',
            args: SplashRouteArgs(key: key, userName: userName),
            rawPathParams: {'userName': userName});

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key, required this.userName});

  final _i5.Key? key;

  final String userName;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.UnknownScreen]
class UnknownRoute extends _i4.PageRouteInfo<void> {
  const UnknownRoute() : super(UnknownRoute.name, path: '/unknown-screen');

  static const String name = 'UnknownRoute';
}
