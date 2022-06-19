import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:knocard_ui/domain/profile/profile_video.dart';

class KVideoItemdesktop extends StatelessWidget {
  final ProfileVideo video;
  const KVideoItemdesktop({Key? key, required this.number, required this.video})
      : super(key: key);
  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(
            color: const Color(0xFF2A2A2A),
            fontSize: 6.sp,
          ),
        ),
        SizedBox(width: 2.w),
        Image(
          image: const AssetImage('assets/images/video.png'),
          height: 40.h,
          width: 70.w,
        ),
        // ImageNetwork(
        //   image: video.thumbnail,
        //   height: 40.h,
        //   width: 70.w,
        //   imageCache: CachedNetworkImageProvider(video.thumbnail),
        // ),
        SizedBox(width: 2.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              // 'Get MORE With Time Blocking',
              video.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF2A2A2A),
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              // 'Matt Bayrom',
              video.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF878788),
                fontSize: 6.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
