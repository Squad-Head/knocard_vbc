import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/presentation/bottom_navigation.dart';
import 'package:knocard_ui/presentation/home_page/tabs/about_page.dart';
import 'package:knocard_ui/presentation/home_page/tabs/favorite_page.dart';

import 'tabs/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final PageController _controller = PageController();
    List<Widget> pages = [
      const HomeView(),
      Text('Reporting'),
      const FavoritePage(),
      const About(),
      Text('data'),
    ];

    return Scaffold(
      body:
          // const HomeView(),
          PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemCount: pages.length,
        itemBuilder: (context, index) => pages[index],
      ),
      bottomNavigationBar:
          // BottomNavigation()
          ConvexAppBar(
        height: 70.h,
        disableDefaultTabController: false,
        items: [
          TabItem(
            icon: ImageIcon(
              const AssetImage('assets/icons/Path 8.png'),
              color: Theme.of(context).canvasColor,
            ),
            title: 'Home',
          ),
          TabItem(
            icon: ImageIcon(
              const AssetImage('assets/icons/Path 1.png'),
              color: Theme.of(context).canvasColor,
            ),
            title: 'Reporting',
          ),
          TabItem(
            isIconBlend: true,
            icon: ImageIcon(
              const AssetImage('assets/icons/Path 4.png'),
              color: Theme.of(context).canvasColor,
              size: 2.sp,
            ),
            title: 'Share',
          ),
          TabItem(
            icon: ImageIcon(
              const AssetImage('assets/icons/Path 11.png'),
              color: Theme.of(context).canvasColor,
            ),
            title: 'Messages',
          ),
          TabItem(
            icon: ImageIcon(
              const AssetImage('assets/icons/Group 20.png'),
              color: Theme.of(context).canvasColor,
            ),
            title: 'Community',
          ),
        ],
        style: TabStyle.fixedCircle,
        initialActiveIndex: 0,
        onTap: (int i) {
          currentIndex = i;
          _controller.jumpToPage(i);
        },
      ),
    );
  }
}
