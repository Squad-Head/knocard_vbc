import 'package:flutter/widgets.dart';
import 'package:knocard_ui/presentation/home/desktop_home_page.dart';
import 'package:knocard_ui/presentation/home/mobile_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width > 700) {
        return const DesktopHomePage();
      } else {
        return const MobileHomePage();
      }
    });
  }
}
