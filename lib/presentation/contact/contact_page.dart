import 'package:flutter/widgets.dart';
import 'package:knocard_ui/presentation/contact/desktop_contact_page.dart';
import 'package:knocard_ui/presentation/contact/mobile_contact_page.dart';

class ContactPage extends StatelessWidget {
  final VoidCallback moveToGallery;
  final VoidCallback moveToVideo;
  const ContactPage(
      {Key? key, required this.moveToGallery, required this.moveToVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width > 700) {
        return DesktopContactPage(
          moveToGallery: moveToGallery,
          moveToVideo: moveToVideo,
        );
      } else {
        return MobileContactPage(
          moveToGallery: moveToGallery,
          moveToVideo: moveToVideo,
        );
      }
    });
  }
}
