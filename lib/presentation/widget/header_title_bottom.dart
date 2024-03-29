import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/constants.dart';
import 'package:knocard_ui/presentation/contact/widgtes/menu_item.dart';

import 'package:flutter/material.dart' hide MenuItem;
import 'package:url_launcher/url_launcher_string.dart';

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
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffF6F6FF),
        child: Row(
          mainAxisAlignment: screenWidth > 700
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: [
            MenuItem(
              icon: FontAwesomeIcons.mobileScreen,
              text: 'Contact',
              selected: index == 0,
              onTap: () => onTap(0),
            ),
            if (screenWidth > 700 && user.isSelected(7)) SizedBox(width: 12.w),
            if (user.isSelected(7))
              MenuItem(
                icon: FontAwesomeIcons.images,
                text: 'Gallery',
                selected: index == 1,
                onTap: () => onTap(1),
              ),
            if (screenWidth > 700 && user.isSelected(8)) SizedBox(width: 12.w),
            if (user.isSelected(8))
              MenuItem(
                icon: FontAwesomeIcons.video,
                text: 'Videos',
                selected: index == 2,
                onTap: () => onTap(2),
              ),
            if (screenWidth > 700 && user.isSelected(9)) SizedBox(width: 12.w),
            if (user.company.business_page_title.isNotEmpty &&
                user.isSelected(9))
              MenuItem(
                icon: Constants.externalIcons[user.company.icon].icon,
                text: user.company.business_page_title,
                selected: index == 3,
                onTap: () => onTap(3),
              ),
            if (screenWidth > 700 && user.isSelected(10)) SizedBox(width: 12.w),
            if (user.external_pages != null && user.isSelected(10))
              MenuItem(
                icon: user.external_pages!.icon.isNotEmpty &&
                        user.external_pages?.icon != '-1'
                    ? Constants
                        .externalIcons[int.parse(user.external_pages!.icon)]
                        .icon
                    : FontAwesomeIcons.handshake,
                text: user.external_pages!.name,
                selected: index == 4,
                onTap: () async {
                  final canLaunch =
                      await canLaunchUrlString(user.external_pages!.link);
                  if (canLaunch) {
                    launchUrlString(user.external_pages!.link);
                  }
                },
              ),
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
