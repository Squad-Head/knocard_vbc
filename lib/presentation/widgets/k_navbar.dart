import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/presentation/home_services/home_services.dart';
import 'package:knocard_ui/presentation/review/review_page.dart';
import 'package:line_icons/line_icons.dart';

class KNavbar extends HookConsumerWidget {
  const KNavbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(0xfff6f6ff),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: SizedBox(
        height: 60.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _navItem(
              context,
              "Contacts",
              FontAwesomeIcons.mobileScreen,
              onTap: () {},
            ),
            _navItem(
              context,
              "Gallery",
              FontAwesomeIcons.image,
              onTap: () {},
            ),
            _navItem(
              context,
              "Videos",
              LineIcons.film,
              onTap: () {},
            ),
            _navItem(
              context,
              "Contractor",
              Icons.phone_android,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeService()));
              },
            ),
            _navItem(
              context,
              "Reviews",
              Icons.phone_android,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ReviewPage()));
              },
            ),
            _navItem(
              context,
              "Rates",
              Icons.phone_android,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, String text, IconData icon,
      {required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 30.sp,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}