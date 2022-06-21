import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:knocard_ui/domain/profile/profile_video.dart';

class WebVideoItem extends StatelessWidget {
  final int index;
  final ProfileVideo video;
  const WebVideoItem({
    required this.index,
    required this.video,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          // '1',
          (index + 1).toString(),
          style: TextStyle(
            color: const Color(0xFF2A2A2A),
            fontSize: 7.sp,
          ),
        ),
        SizedBox(width: 2.w),
        Image.network(
          video.thumbnail,
          height: 21.h,
          width: MediaQuery.of(context).size.width * .03,
        ),
        SizedBox(width: 4.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // 'Get MORE With Time Blocking',
              video.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF2A2A2A),
                fontSize: 4.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .06,
              ),
              child: Text(
                // 'Matt Bayrom',
                video.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color(0xFF878788),
                  fontSize: 5.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
