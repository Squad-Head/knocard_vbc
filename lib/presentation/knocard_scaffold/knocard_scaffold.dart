import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/presentation/community/community_page.dart';
import 'package:knocard_ui/presentation/contact/contact_page.dart';
import 'package:knocard_ui/presentation/home/home_page.dart';
import 'package:knocard_ui/presentation/messages/messages.dart';
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
              icon: Image.asset(AssetIcons.navHome),
              title: "Home",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(),
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
                    builder: (_) => ContactPage(),
                  ),
                );
              }),
          TabData(
              icon: Image.asset(AssetIcons.navShare),
              title: "Share",
              onTap: () {}),
          TabData(
              icon: Image.asset(
                AssetIcons.navMessage,
                height: 40,
                fit: BoxFit.cover,
              ),
              title: "Message",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Messages(),
                  ),
                );
              }),
          TabData(
              icon: Image.asset(AssetIcons.navCommunity),
              title: "Community",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CommuniyPage(),
                  ),
                );
              }),
        ],
        onTabChangedListener: (position) {},
      ),
    );
  }
}
