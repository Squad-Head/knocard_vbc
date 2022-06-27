// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:clean_api/clean_api.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

import '../home/home_page.dart' as _i2;
import '../splash_screen.dart' as _i1;
import '../unknown_screen.dart' as _i3;
import '../username_not_found.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () =>
              SplashRouteArgs(userName: pathParams.getString('userName')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(key: args.key, userName: args.userName));
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    UnknownRoute.name: (routeData) {
      final args = routeData.argsAs<UnknownRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.UnknownScreen(key: args.key, failure: args.failure));
    },
    UserNameNotFoundRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.UserNameNotFoundPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/:userName', fullMatch: true),
        _i5.RouteConfig(SplashRoute.name, path: '/:userName'),
        _i5.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i5.RouteConfig(UnknownRoute.name, path: '/unknown-screen'),
        _i5.RouteConfig(UserNameNotFoundRoute.name,
            path: '/user-name-not-found-page')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({_i6.Key? key, required String userName})
      : super(SplashRoute.name,
            path: '/:userName',
            args: SplashRouteArgs(key: key, userName: userName),
            rawPathParams: {'userName': userName});

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key, required this.userName});

  final _i6.Key? key;

  final String userName;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.UnknownScreen]
class UnknownRoute extends _i5.PageRouteInfo<UnknownRouteArgs> {
  UnknownRoute({_i6.Key? key, required _i7.CleanFailure failure})
      : super(UnknownRoute.name,
            path: '/unknown-screen',
            args: UnknownRouteArgs(key: key, failure: failure));

  static const String name = 'UnknownRoute';
}

class UnknownRouteArgs {
  const UnknownRouteArgs({this.key, required this.failure});

  final _i6.Key? key;

  final _i7.CleanFailure failure;

  @override
  String toString() {
    return 'UnknownRouteArgs{key: $key, failure: $failure}';
  }
}

/// generated route for
/// [_i4.UserNameNotFoundPage]
class UserNameNotFoundRoute extends _i5.PageRouteInfo<void> {
  const UserNameNotFoundRoute()
      : super(UserNameNotFoundRoute.name, path: '/user-name-not-found-page');

  static const String name = 'UserNameNotFoundRoute';
}
