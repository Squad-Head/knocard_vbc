import 'package:auto_route/auto_route.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/application/profile_state.dart';

import 'package:knocard_ui/presentation/router/router.gr.dart';
import 'package:knocard_ui/presentation/widget/header_background.dart';
import 'package:knocard_ui/presentation/widget/header_title_bottom.dart';

class HomePage extends HookConsumerWidget {
  final String userName;
  final String? shareCode;
  const HomePage(
      {Key? key,
      @PathParam('userName') required this.userName,
      @QueryParam('sc') this.shareCode})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final ValueNotifier<int> index = useState(0);
    // final controller = usePageController(initialPage: 0);
    useEffect(() {
      Logger.i("username: $userName");
      Logger.i("sharecode: $shareCode");
      Future.delayed(const Duration(milliseconds: 100), () {
        if (userName == ':userName' || userName == 'unknown-screen') {
          AutoRouter.of(context).replace(const UserNameNotFoundRoute());
        } else {
          ref.read(profileProvider.notifier).getProfile(userName, shareCode);
          Logger.i('called $userName');
        }
      });
      return null;
    }, []);
    ref.listen<ProfileState>(profileProvider, (previous, next) {
      if (previous != next && !next.loading) {
        if (next.failure != CleanFailure.none()) {
          AutoRouter.of(context).replace(const UserNameNotFoundRoute());
        }
      }
    });
    final state = ref.watch(profileProvider);
    return Scaffold(
        body: state.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : AutoTabsRouter.pageView(
                physics: const NeverScrollableScrollPhysics(),
                routes: [
                  const ContactRoute(),
                  const GalleryRoute(),
                  const VideoRoute(),
                  if (state.userProfile.company.business_page_title.isNotEmpty)
                    const BusinessRoute()
                ],
                builder: (context, child, controller) {
                  return HookBuilder(builder: (context) {
                    useEffect(() {
                      Future.delayed(const Duration(milliseconds: 100), () {
                        index.value = AutoTabsRouter.of(context).activeIndex;
                        controller.addListener(() {
                          final i = controller.page!.toInt();
                          index.value = i;
                        });
                      });

                      return null;
                    });
                    return NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverAppBar(
                            expandedHeight: 350,
                            elevation: 0,
                            collapsedHeight: 60,
                            toolbarHeight: 60,
                            pinned: true,
                            bottom: HeaderBottom(
                                index: index.value,
                                onTap: (i) {
                                  return controller.animateToPage(i,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                }),
                            flexibleSpace: FlexibleSpaceBar(
                              expandedTitleScale: 1,
                              background: HeaderBackground(
                                index: index.value,
                                goHome: () {
                                  Logger.i(index.value);
                                  controller.animateToPage(0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                },
                              ),
                            ),
                          ),
                        ];
                      },
                      body: child,
                    );
                  });
                }));
  }
}
