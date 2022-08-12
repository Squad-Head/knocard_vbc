import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/constants.dart';
import 'package:knocard_ui/domain/profile/user_profile.dart';
import 'package:knocard_ui/presentation/app/external_link_page.dart';
import 'package:knocard_ui/presentation/contact/widgtes/menu_item.dart';

import 'package:flutter/material.dart' hide MenuItem;

class HeaderBottomExternal extends ConsumerWidget with PreferredSizeWidget {
  const HeaderBottomExternal({
    Key? key,
  }) : super(key: key);

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
              text: 'Contacts',
              selected: false,
              onTap: () {
                Navigator.pop(context, 0);
              },
            ),
            if (screenWidth > 700) SizedBox(width: 12.w),
            MenuItem(
              icon: FontAwesomeIcons.images,
              text: 'Gallery',
              selected: false,
              onTap: () {
                Navigator.pop(context, 1);
              },
            ),
            if (screenWidth > 700) SizedBox(width: 12.w),
            MenuItem(
              icon: FontAwesomeIcons.video,
              text: 'Videos',
              selected: false,
              onTap: () {
                Navigator.pop(context, 2);
              },
            ),
            if (screenWidth > 700) SizedBox(width: 12.w),
            if (user.company.business_page_title.isNotEmpty)
              MenuItem(
                icon: Constants.externalIcons[user.company.icon].icon,
                text: user.company.business_page_title,
                selected: false,
                onTap: () {
                  Navigator.pop(context, 3);
                },
              ),
            if (screenWidth > 700) SizedBox(width: 12.w),
            if (user.external_pages != null)
              MenuItem(
                icon: user.external_pages!.icon.isNotEmpty &&
                        user.external_pages?.icon != '-1'
                    ? Constants
                        .externalIcons[int.parse(user.external_pages!.icon)]
                        .icon
                    : FontAwesomeIcons.handshake,
                text: user.external_pages!.name,
                selected: false,
                onTap: () {},
              ),
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
