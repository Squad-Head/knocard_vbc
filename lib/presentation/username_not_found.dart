import 'package:auto_route/auto_route.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/application/profile_state.dart';

import 'router/router.gr.dart';

class UserNameNotFoundPage extends HookConsumerWidget {
  const UserNameNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final usernameController = useTextEditingController();
    final state = ref.watch(profileProvider);

    ref.listen<ProfileState>(profileProvider, (previous, next) {
      if (previous != next && !next.loading) {
        if (next.failure == CleanFailure.none()) {
          AutoRouter.of(context).replace(const HomeRoute());
        } else {
          AutoRouter.of(context).push(UnknownRoute(failure: next.failure));
        }
      }
    });
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: Image.asset('assets/images/no_username.png'),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: const Text(
                    'Hi, we couldn\'t find any username on the url !',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                child: const Text(
                    'We know how frustrating it is to see this page, still you can check the details of the failure and share it to our developer to make this platform bulletproof'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    suffix: state.loading
                        ? const CircularProgressIndicator()
                        : InkWell(
                            onTap: () {
                              if (usernameController.text.isNotEmpty) {
                                ref
                                    .read(profileProvider.notifier)
                                    .getProfile(usernameController.text);
                              }
                            },
                            child: const Icon(Icons.search)),
                    hintText: "Username",
                    filled: true,
                    fillColor: const Color(0xFFECECEC),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
