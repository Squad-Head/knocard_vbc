import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart' hide MenuItem;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/style/color.dart';

class HeaderTitle extends ConsumerWidget {
  const HeaderTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        Container(
          height: 50.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: KColor.primaryColor,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFB1B2B7),
                offset: Offset(0, 4),
                blurRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 140.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Brett Flemming",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                const Text(
                  "Contractor",
                  style: TextStyle(
                    color: Color(0xFFB9BBBA),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 40.w,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(ref.watch(profileProvider
                  .select((value) => value.userProfile.profile_picture))),
            ),
          ),
        ),
      ],
    );
  }
}
