import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knocard_ui/domain/image_video/post_data.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import 'single_content_view.dart';

class MultiContentView extends HookWidget {
  final PostData post;
  const MultiContentView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final selectedPage = useState(0);
    final pageController = usePageController();

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: PageView(
            controller: pageController,
            onPageChanged: (value) {
              selectedPage.value = value;
            },
            children: List.generate(post.contents.length, (index) {
              return SingleContentView(
                content: post.contents[index],
              );
            }),
          ),
        ),
        Positioned(
          bottom: 10.h,
          child: PageViewDotIndicator(
            size: const Size(8, 8),
            unselectedSize: const Size(5, 5),
            currentItem: selectedPage.value,
            count: post.contents.length,
            unselectedColor: Colors.grey,
            selectedColor: Colors.blue,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (selectedPage.value > 0)
              IconButton(
                onPressed: () {
                  selectedPage.value = selectedPage.value - 1;
                  pageController.animateToPage(selectedPage.value,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(FontAwesomeIcons.circleArrowLeft),
                color: Colors.white,
              )
            else
              const SizedBox.shrink(),
            if (selectedPage.value < (post.contents.length - 1))
              IconButton(
                onPressed: () {
                  selectedPage.value = selectedPage.value + 1;
                  pageController.animateToPage(selectedPage.value,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(FontAwesomeIcons.circleArrowRight),
                color: Colors.white,
              )
            else
              const SizedBox.shrink()
          ],
        )
      ],
    );
  }
}
