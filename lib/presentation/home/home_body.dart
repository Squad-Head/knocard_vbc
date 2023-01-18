import 'package:auto_route/auto_route.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/user_profile.dart';
import 'package:knocard_ui/presentation/widget/header_background.dart';
import 'package:knocard_ui/presentation/widget/header_title_bottom.dart';

class HomeBody extends HookConsumerWidget {
  final PageController controller;
  final Widget child;
  final UserProfile profile;
  const HomeBody(
      {Key? key,
      required this.controller,
      required this.child,
      required this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final ValueNotifier<int> index = useState(0);
    final state = ref.watch(profileProvider);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {

        index.value = AutoTabsRouter.of(context).activeIndex;
        controller.addListener(() {
          final i = controller.page!.toInt();
          index.value = i;
        });
        if (!state.setHome) {
          controller.jumpToPage(state.userProfile.homeIndex);
          ref.read(profileProvider.notifier).settedHome();
        }
      });

      return null;
    });
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 450,
            elevation: 0,
            collapsedHeight: 60,
            toolbarHeight: 60,
            pinned: true,
            bottom: HeaderBottom(
                index: index.value,
                onTap: (i) {
                  return controller.animateToPage(i,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              background: HeaderBackground(
                index: index.value,
                goHome: () {
                  Logger.i(index.value);
                  controller.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
              ),
            ),
          ),
        ];
      },
      body: child,
    );
  }
}
