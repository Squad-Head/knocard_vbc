import 'package:auto_route/auto_route.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/application/profile_state.dart';
import 'package:knocard_ui/presentation/home/home_page.dart';
import 'package:knocard_ui/presentation/username_not_found.dart';

import 'router/router.gr.dart';

class SplashScreen extends HookConsumerWidget {
  final String userName;
  const SplashScreen({Key? key, @PathParam('userName') required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // final state = ref.watch(profileProvider);
    useEffect(() {
      Logger.i(userName);
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(profileProvider.notifier).getProfile('iamginofernando');
        // if (userName == ':userName' || userName == 'unknown-screen') {
        //   AutoRouter.of(context).replace(const UserNameNotFoundRoute());
        // } else {
        //   ref.read(profileProvider.notifier).getProfile(userName);
        // }
      });
      return null;
    }, []);

    ref.listen<ProfileState>(profileProvider, (previous, next) {
      if (previous != next && !next.loading) {
        if (next.failure == CleanFailure.none()) {
          AutoRouter.of(context).replace(const HomeRoute());
        } else {
          AutoRouter.of(context).replace(const UserNameNotFoundRoute());
        }
      }
    });
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
