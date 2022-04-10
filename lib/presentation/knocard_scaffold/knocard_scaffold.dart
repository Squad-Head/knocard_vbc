import 'package:flutter/material.dart';

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
        body: Stack(
          children: [
            if (hasBackground)
              Image.asset(
                'assets/background/background.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            body,
          ],
        ),
        bottomNavigationBar: bottomNavigation);
  }
}
