import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:knocard_ui/domain/profile/profile_video.dart';
import 'package:knocard_ui/infrastructure/youtube_util.dart';

class KVideoItemdesktop extends StatelessWidget {
  final bool seleted;
  final ProfileVideo video;
  const KVideoItemdesktop(
      {Key? key,
      required this.number,
      required this.video,
      required this.seleted})
      : super(key: key);
  final String number;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: seleted ? 3 : 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              number,
              style: TextStyle(
                color: const Color(0xFF2A2A2A),
                fontSize: 12.sp,
              ),
            ),
            SizedBox(width: 2.w),
            CachedNetworkImage(
              imageUrl: YoutubeUtil.videoThumbnail(video),
              height: 60.h,
              width: 90.w,
            ),
            SizedBox(width: 2.w),
           Expanded(child:  Column(
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
                   fontSize: 14.sp,
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
                   fontSize: 10.sp,
                 ),
               ),
             ],
           )),
          ],
        ),
      ),
    );
  }
}
