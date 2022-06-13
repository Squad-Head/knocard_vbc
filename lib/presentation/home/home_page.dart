import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:knocard_ui/presentation/contact/contact_page.dart';
import 'package:knocard_ui/presentation/contractor_page/constractor_page.dart';
import 'package:knocard_ui/presentation/gallery/gallery_page.dart';

import 'package:knocard_ui/presentation/review/review.dart';
import 'package:knocard_ui/presentation/videos/videos_page.dart';
import 'package:knocard_ui/presentation/widget/header_background.dart';
import 'package:knocard_ui/presentation/widget/header_title_bottom.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> index = useState(0);
    final controller = usePageController();
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        controller.addListener(() {
          final i = controller.page!.toInt();
          index.value = i;
        });
      });
      return null;
    }, []);
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 220,
            toolbarHeight: 50,
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
                  controller.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                coverPhoto:
                    'https://images.pexels.com/photos/2693529/pexels-photo-2693529.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
              ),
            ),
          ),
        ];
      },
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          ContactPage(
            moveToGallery: () {
              controller.jumpToPage(1);
            },
            moveToVideo: () {
              controller.jumpToPage(2);
            },
          ),
          const GalleryPage(),
          const VideoPage(),
          const ConstractorPage(),
          const Review(),
          // BlankRatesPage()
        ],
      ),
    ));
  }
}

onTap(int i) {}
