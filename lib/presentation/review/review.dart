import 'package:flutter/material.dart';
import 'package:knocard_ui/presentation/review/screen/mobile_review_page.dart';

import 'screen/desktop_review_page.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width > 700) {
        return const DesktopReviewPage();
      } else {
        return const MobileReviewPage();
      }
    });
  }
}
