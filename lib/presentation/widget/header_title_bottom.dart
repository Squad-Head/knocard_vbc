import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knocard_ui/presentation/contact/widgtes/menu_item.dart';

import 'package:flutter/material.dart' hide MenuItem;

class HeaderBottom extends StatelessWidget with PreferredSizeWidget {
  final int index;
  final Function(int) onTap;
  const HeaderBottom({Key? key, required this.index, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xffF6F6FF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuItem(
            icon: FontAwesomeIcons.mobileScreen,
            text: 'Contacts',
            selected: index == 0,
            onTap: () => onTap(0),
          ),
          SizedBox(width: 12.w),
          MenuItem(
            icon: FontAwesomeIcons.images,
            text: 'Gallery',
            selected: index == 1,
            onTap: () => onTap(1),
          ),
          SizedBox(width: 12.w),
          MenuItem(
            icon: FontAwesomeIcons.video,
            text: 'Videos',
            selected: index == 2,
            onTap: () => onTap(2),
          ),
          SizedBox(width: 12.w),
          MenuItem(
            icon: FontAwesomeIcons.leaf,
            text: 'Contractor',
            selected: index == 3,
            onTap: () => onTap(3),
          ),
          SizedBox(width: 12.w),
          MenuItem(
            icon: FontAwesomeIcons.handshake,
            text: 'Reviews',
            selected: index == 4,
            onTap: () => onTap(4),
          ),
          SizedBox(width: 12.w),
          MenuItem(
            icon: FontAwesomeIcons.calendarCheck,
            text: 'Rates',
            selected: index == 5,
            onTap: () => onTap(5),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
