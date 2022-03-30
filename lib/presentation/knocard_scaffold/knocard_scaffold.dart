import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/resources/resources.dart';

import 'widget/custom_bottom_nav.dart';

class KnoCardScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  const KnoCardScaffold({Key? key, required this.body, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: CustomBottomNavigation(
        circleColor: Colors.red,
        tabs: [
          TabData(
              icon: Image.asset(AssetIcons.group), title: "Home", onTap: () {}),
          TabData(
              icon: Image.asset(AssetIcons.group),
              title: "Search",
              onTap: () {}),
          TabData(
              icon: Image.asset(AssetIcons.group),
              title: "Basket",
              onTap: () {}),
          TabData(
              icon: Image.asset(AssetIcons.group),
              title: "Search",
              onTap: () {}),
          TabData(
              icon: Image.asset(AssetIcons.group),
              title: "Search",
              onTap: () {}),
        ],
        onTabChangedListener: (position) {},
      ),
    );
  }
}
