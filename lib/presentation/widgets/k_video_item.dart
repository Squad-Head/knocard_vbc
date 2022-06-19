import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';
import 'package:knocard_ui/domain/profile/profile_video.dart';

class KVideoItem extends StatelessWidget {
  final int index;
  final ProfileVideo video;
  const KVideoItem({
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
            fontSize: 20.sp,
          ),
        ),
        SizedBox(width: 5.w),
        // const Image(
        //   image: AssetImage('assets/images/video.png'),
        // ),
        ImageNetwork(
          height: 27.h,
          width: MediaQuery.of(context).size.width * .1,
          image: video.thumbnail,
        ),
        SizedBox(width: 15.w),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // 'Get MORE With Time Blocking',
                video.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color(0xFF2A2A2A),
                  fontSize: 25.sp,
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
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
