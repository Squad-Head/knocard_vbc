import 'package:flutter/widgets.dart';

import 'package:knocard_ui/presentation/gallery/desktop_gallery/screens/homepage.dart';

import 'package:knocard_ui/presentation/gallery/mobile_gallery_widgets/mobile_gallery.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width > 700) {
        return const DesktopGalleryPage();
      } else {
        return const MobileGalleryPage();
      }
    });
  }
}
