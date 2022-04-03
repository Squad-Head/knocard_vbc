import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/style/color.dart';
import 'tab_item.dart';
export 'tab_item.dart';

double CIRCLE_SIZE = 60.h;
const double ARC_HEIGHT = 70;
const double ARC_WIDTH = 90;
const double CIRCLE_OUTLINE = 10;
const double SHADOW_ALLOWANCE = 20;
const double BAR_HEIGHT = 60;
const int ANIM_DURATION = 300;

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation(
      {required this.tabs,
      required this.onTabChangedListener,
      Key? key,
      this.initialSelection = 0,
      this.circleColor,
      this.activeIconColor,
      this.inactiveIconColor,
      this.textColor,
      this.barBackgroundColor})
      : assert(tabs.length == 5),
        super(key: key);

  final Function(int position) onTabChangedListener;
  final Color? circleColor;
  final Color? activeIconColor;
  final Color? inactiveIconColor;
  final Color? textColor;
  final Color? barBackgroundColor;
  final List<TabData> tabs;
  final int initialSelection;

  @override
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation>
    with TickerProviderStateMixin, RouteAware {
  IconData nextIcon = Icons.search;
  IconData activeIcon = Icons.search;

  int currentSelected = 0;

  final Color circleColor = KColor.primaryColor;
  final Color activeIconColor = Colors.white;
  late Color inactiveIconColor;
  late Color barBackgroundColor;
  late Color textColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    activeIcon = Icons.search;

    barBackgroundColor = const Color(0xff088AC7);
    textColor = widget.textColor ??
        ((Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Colors.black54);
    inactiveIconColor = (widget.inactiveIconColor) ??
        ((Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Theme.of(context).primaryColor);
  }

  @override
  void initState() {
    super.initState();
    _setSelected();
  }

  _setSelected() {
    int selected = 2;

    if (mounted) {
      setState(() {
        currentSelected = selected;
        nextIcon = Icons.search;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          height: BAR_HEIGHT,
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
              TabItem(tabData: widget.tabs[0]),
              TabItem(tabData: widget.tabs[1]),
              const IconButton(onPressed: null, icon: SizedBox.shrink()),
              TabItem(tabData: widget.tabs[3]),
              TabItem(tabData: widget.tabs[4])
            ],
          ),
        ),
        Positioned.fill(
          top: -(CIRCLE_SIZE + CIRCLE_OUTLINE + SHADOW_ALLOWANCE) / 2,
          child: AnimatedAlign(
            duration: const Duration(milliseconds: ANIM_DURATION),
            curve: Curves.easeOut,
            alignment: const Alignment(0, 1),
            child: GestureDetector(
              onTap: widget.tabs[2].onTap,
              child: Column(
                children: [
                  SizedBox(
                    height: CIRCLE_SIZE + SHADOW_ALLOWANCE,
                    width: CIRCLE_SIZE + SHADOW_ALLOWANCE,
                    child: Center(
                      child: Container(
                          width: CIRCLE_SIZE + CIRCLE_OUTLINE,
                          height: CIRCLE_SIZE + CIRCLE_OUTLINE,
                          child: widget.tabs[2].icon,
                          decoration: BoxDecoration(
                              color: circleColor,
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ])),
                    ),
                  ),
                  Text(
                    widget.tabs[2].title,
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
