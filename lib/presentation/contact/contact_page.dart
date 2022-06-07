import 'package:flutter/widgets.dart';
import 'package:knocard_ui/presentation/contact/desktop_home_page.dart';
import 'package:knocard_ui/presentation/contact/mobile_home_page.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width > 700) {
        return const DesktopContactPage();
      } else {
        return const MobileContactPage();
      }
    });
  }
}
