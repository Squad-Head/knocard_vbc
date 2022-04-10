import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/style/color.dart';
import 'tab_item.dart';
export 'tab_item.dart';

class CustomBottomNavigation extends StatelessWidget {
  CustomBottomNavigation({
    required this.tabs,
    Key? key,
    this.initialSelection = 0,
    this.activeIconColor,
    this.inactiveIconColor,
    this.textColor,
  })  : assert(tabs.length == 5),
        super(key: key);

  final Color? activeIconColor;
  final Color? inactiveIconColor;
  final Color? textColor;
  final List<TabData> tabs;
  final int initialSelection;

  final double circleSize = 60.h;
  final double circleOutLine = 10;
  final double shadowAllowance = 20;
  final double barHeight = 60.h;
  final int animDuration = 300;

  final Color circleColor = KColor.primaryColor;
  final Color barBackgroundColor = const Color(0xff088AC7);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          height: barHeight,
          decoration: BoxDecoration(
              color: barBackgroundColor,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, -1), blurRadius: 8)
              ]),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabItem(tabData: tabs[0]),
              TabItem(tabData: tabs[1]),
              const IconButton(onPressed: null, icon: SizedBox.shrink()),
              TabItem(tabData: tabs[3]),
              TabItem(tabData: tabs[4])
            ],
          ),
        ),
        Positioned.fill(
          top: -(circleSize + circleOutLine + shadowAllowance) / 2,
          child: Align(
            alignment: const Alignment(0, 1),
            child: GestureDetector(
              onTap: tabs[2].onTap,
              child: Column(
                children: [
                  SizedBox(
                    height: circleSize + shadowAllowance,
                    width: circleSize + shadowAllowance,
                    child: Center(
                      child: Container(
                          width: circleSize + circleOutLine,
                          height: circleSize + circleOutLine,
                          child: tabs[2].icon,
                          decoration: BoxDecoration(
                              color: circleColor,
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ])),
                    ),
                  ),
                  Text(
                    tabs[2].title,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
