import 'package:flutter/material.dart';

import 'package:knocard_ui/presentation/contact/contact_page.dart';
import 'package:knocard_ui/presentation/home/home_page.dart';
import 'package:knocard_ui/resources/resources.dart';

import 'widget/custom_bottom_nav.dart';

class KnoCardScaffold extends StatelessWidget {
  final Widget body;
  final CustomBottomNavigation? bottomNavigation;
  final PreferredSizeWidget? appBar;
  final bool hasBackground;
  const KnoCardScaffold(
      {Key? key,
      required this.body,
      this.appBar,
      this.bottomNavigation,
      this.hasBackground = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: CustomBottomNavigation(tabs: [
        TabData(
            icon: Image.asset(AssetIcons.navHome),
            title: "Home",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomePage(),
                ),
              );
            }),
        TabData(
            icon: Image.asset(AssetIcons.navReporting),
            title: "Reporting",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ContactPage(),
                ),
              );
            }),
        TabData(
            icon: Image.asset(AssetIcons.navShare),
            title: "Share",
            onTap: () {}),
      ]),
    );
  }
}
