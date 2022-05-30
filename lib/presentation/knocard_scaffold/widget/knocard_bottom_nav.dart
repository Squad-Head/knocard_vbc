import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/presentation/community/community_page.dart';
import 'package:knocard_ui/presentation/contact/contact_page.dart';
import 'package:knocard_ui/presentation/groups/groups.dart';
import 'package:knocard_ui/presentation/home/home_page.dart';
import 'package:knocard_ui/presentation/knocard_scaffold/widget/custom_bottom_nav.dart';
import 'package:knocard_ui/presentation/messages/message_screen.dart';
import 'package:knocard_ui/resources/asset_icons.dart';

class KnoCardBottomNav {
  KnoCardBottomNav._();

  static CustomBottomNavigation home(BuildContext context) {
    return CustomBottomNavigation(
      tabs: [
        TabData(
            icon: Image.asset(
              AssetIcons.navHome,
              width: 25.w,
            ),
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
            icon: Image.asset(
              AssetIcons.navReporting,
              width: 25.w,
            ),
            title: "Reporting",
            onTap: () {}),
        TabData(
            icon: Image.asset(
              AssetIcons.navShare,
              width: 25.w,
            ),
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
                  builder: (_) => const MessageScreen(),
                ),
              );
            }),
        TabData(
            icon: Image.asset(
              AssetIcons.navCommunity,
              width: 25.w,
            ),
            title: "Community",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CommuniyPage(),
                ),
              );
            }),
      ],
    );
  }

  static CustomBottomNavigation contact(BuildContext context) {
    return CustomBottomNavigation(
      tabs: [
        TabData(
            icon: Image.asset(
              AssetIcons.navHome,
              width: 25.w,
            ),
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
            icon: Image.asset(
              AssetIcons.navFavouriteBottom,
              width: 25.w,
            ),
            title: "Favourites",
            onTap: () {}),
        TabData(
            icon: Image.asset(AssetIcons.sync), title: "SYNC", onTap: () {}),
        TabData(
            icon: Image.asset(
              AssetIcons.navMessage,
              height: 40,
              fit: BoxFit.cover,
            ),
            title: "Messages",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MessageScreen(),
                ),
              );
            }),
        TabData(
            icon: Image.asset(
              AssetIcons.historyBottomnav,
              width: 25.w,
            ),
            title: "History",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CommuniyPage(),
                ),
              );
            }),
      ],
    );
  }

  static CustomBottomNavigation community(BuildContext context) {
    return CustomBottomNavigation(
      tabs: [
        TabData(
            icon: Image.asset(
              AssetIcons.navHome,
              width: 25.w,
            ),
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
            icon: Image.asset(
              AssetIcons.navFavouriteBottom,
              width: 25.w,
            ),
            title: "Favourites",
            onTap: () {}),
        TabData(
            icon: Padding(
              padding: EdgeInsets.all(15.w),
              child: Image.asset(
                AssetIcons.navsearchBottom,
              ),
            ),
            title: "Search",
            onTap: () {}),
        TabData(
            icon: Image.asset(
              AssetIcons.navcontactBottom,
              height: 40,
              fit: BoxFit.cover,
            ),
            title: "Contact",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MessageScreen(),
                ),
              );
            }),
        TabData(
            icon: Image.asset(
              AssetIcons.networkBottom,
              width: 25.w,
            ),
            title: "Network",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CommuniyPage(),
                ),
              );
            }),
      ],
    );
  }

  static CustomBottomNavigation group(BuildContext context) {
    return CustomBottomNavigation(
      tabs: [
        TabData(
            icon: Image.asset(
              AssetIcons.navHome,
              width: 25.w,
            ),
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
            icon: Image.asset(
              AssetIcons.navFavouriteBottom,
              width: 25.w,
            ),
            title: "Favourites",
            onTap: () {}),
        TabData(
            icon: Image.asset(
              AssetIcons.group,
              width: 25.w,
            ),
            title: "New Group",
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
                  builder: (_) => const MessageScreen(),
                ),
              );
            }),
        TabData(
            icon: Image.asset(
              AssetIcons.navcontactBottom,
              width: 25.w,
            ),
            title: "Contacts",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CommuniyPage(),
                ),
              );
            }),
      ],
    );
  }

  static CustomBottomNavigation message(BuildContext context) {
    return CustomBottomNavigation(
      tabs: [
        TabData(
            icon: Image.asset(
              AssetIcons.navHome,
              width: 25.w,
            ),
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
            icon: Image.asset(
              AssetIcons.navFavouriteBottom,
              width: 25.w,
            ),
            title: "Favourites",
            onTap: () {}),
        TabData(
            icon: Image.asset(
              AssetIcons.navMessage,
              width: 25.w,
            ),
            title: "Compose",
            onTap: () {}),
        TabData(
            icon: Image.asset(
              AssetIcons.navcontactBottom,
              height: 40,
              fit: BoxFit.cover,
            ),
            title: "Contact",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ContactPage(),
                ),
              );
            }),
        TabData(
            icon: Image.asset(
              AssetIcons.navgroupBottom,
              width: 25.w,
            ),
            title: "Groups",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const GroupPage(),
                ),
              );
            }),
      ],
    );
  }
}
