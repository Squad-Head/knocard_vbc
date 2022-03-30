import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabData {
  TabData({required this.icon, required this.title, required this.onTap});

  final Widget icon;
  final String title;
  final Function() onTap;
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.tabData,
  }) : super(key: key);

  final TabData tabData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: EdgeInsets.zero,
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 33.h,
            child: tabData.icon,
          ),
          Text(
            tabData.title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
      onPressed: tabData.onTap,
    );
  }
}
