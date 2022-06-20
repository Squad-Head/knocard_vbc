import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/application/profile_state.dart';
import 'package:knocard_ui/presentation/home/home_page.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(profileProvider.notifier).getProfile();
      });
      return null;
    }, []);

    ref.listen<ProfileState>(profileProvider, (previous, next) {
      if (previous != next && !next.loading) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
