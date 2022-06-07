import 'package:flutter/widgets.dart';
import 'package:knocard_ui/presentation/gallery/desktop_gallery/desktop_gallery.dart';
import 'package:knocard_ui/presentation/gallery/mobile_gallery.dart';
import 'package:knocard_ui/presentation/home/desktop_home_page.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width > 700) {
        return const DesktopGallery();
      } else {
        return const MobileGalleryPage();
      }
    });
  }
}
