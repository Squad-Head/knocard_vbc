import 'package:flutter/material.dart';
import 'package:knocard_ui/presentation/contractor_page/desktop_contractor_page.dart';
import 'package:knocard_ui/presentation/contractor_page/mobile_contractor_page.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width > 700) {
        return const DesktopContractorPage();
      } else {
        return const MobileContractorPage();
      }
    });
  }
}
