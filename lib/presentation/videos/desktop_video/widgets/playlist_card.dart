import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:knocard_ui/domain/profile/playlist.dart';

class PlaylistCard extends ConsumerWidget {
  final bool selected;
  final Playlist playlist;
  final String number;
  const PlaylistCard(
      {Key? key,
      required this.number,
      required this.playlist,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Material(
      elevation: selected ? 3 : 0,
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
            // Image(
            //   image: const AssetImage('assets/images/video.png'),
            //   height: 60.h,
            //   width: 90.w,
            // ),
            ImageNetwork(
              image: playlist.description,
              height: 60.h,
              width: 90.w,
              imageCache: CachedNetworkImageProvider(playlist.description),
            ),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  playlist.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF2A2A2A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
