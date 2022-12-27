import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:knocard_ui/domain/profile/profile_video.dart';
import 'package:knocard_ui/infrastructure/youtube_util.dart';

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
          (index + 1).toString(),
          style: TextStyle(
            color: const Color(0xFF2A2A2A),
            fontSize: 9.sp,
          ),
        ),
        SizedBox(width: 2.w),
        CachedNetworkImage(
          imageUrl: YoutubeUtil.videoThumbnail(video),
          height: 50.h,
          width: MediaQuery.of(context).size.width * .05,
          errorWidget: (context, url, error) => Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width * .05,
            color: Colors.blue[300],
          ),
        ),
        SizedBox(width: 4.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              video.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF2A2A2A),
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.22),
              child: Text(
                video.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color(0xFF878788),
                  fontSize: 8.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
