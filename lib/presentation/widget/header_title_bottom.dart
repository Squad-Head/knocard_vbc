import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/constants.dart';
import 'package:knocard_ui/presentation/contact/widgtes/menu_item.dart';

import 'package:flutter/material.dart' hide MenuItem;

class HeaderBottom extends ConsumerWidget with PreferredSizeWidget {
  final int index;
  final Function(int) onTap;
  const HeaderBottom({Key? key, required this.index, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user =
        ref.watch(profileProvider.select((value) => value.userProfile));
    return LayoutBuilder(builder: (context, constraints) {
      final screenWidth = constraints.maxWidth;
      return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffF6F6FF),
        child: Row(
          mainAxisAlignment: screenWidth > 700
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: [
            MenuItem(
              icon: FontAwesomeIcons.mobileScreen,
              text: 'Contacts',
              selected: index == 0,
              onTap: () => onTap(0),
            ),
            if (screenWidth > 700) SizedBox(width: 12.w),
            MenuItem(
              icon: FontAwesomeIcons.images,
              text: 'Gallery',
              selected: index == 1,
              onTap: () => onTap(1),
            ),
            if (screenWidth > 700) SizedBox(width: 12.w),
            MenuItem(
              icon: FontAwesomeIcons.video,
              text: 'Videos',
              selected: index == 2,
              onTap: () => onTap(2),
            ),
            if (screenWidth > 700) SizedBox(width: 12.w),
            if (user.company.business_page_title.isNotEmpty)
              MenuItem(
                icon: Constants.externalIcons[user.company.icon].icon,
                text: user.company.business_page_title,
                selected: index == 3,
                onTap: () => onTap(3),
              ),
            if (screenWidth > 700) SizedBox(width: 12.w),
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
