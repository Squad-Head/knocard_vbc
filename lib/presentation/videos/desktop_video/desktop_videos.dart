import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/presentation/videos/desktop_video/widgets/k_video_item.dart';
import 'package:knocard_ui/presentation/videos/network_video_player.dart';

class DesktopVideoPage extends HookConsumerWidget {
  const DesktopVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(profileProvider).userProfile;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 15, 4, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 520.h,
                      width: 600.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 400.h,
                            width: 600.w,
                            color: Colors.red,
                            child: NetworkVideoPlayer(
                              state.playlists[0].videos[0].link,
                              // 'https://firebasestorage.googleapis.com/v0/b/knocard-da3f9.appspot.com/o/News%2FKnoCard%20News.mp4?alt=media&token=23aab96c-9ee0-4bf7-b4df-fe9f87a67d3b',
                              autoPlay: false,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.playlists[0].videos[0].title,
                                    // 'Video Title',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.sp),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'view count : ' +
                                        state.playlists[0].videos[0].created_at
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.shareNodes,
                                    color: const Color(0xFF048AC6),
                                    size: 15.sp,
                                  ),
                                  Text(
                                    'Share',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Videos',
                          style: TextStyle(
                            color: const Color(0xFF088AC6),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          height: 220.h,
                          width: 250.w,
                          child: Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    KVideoItemdesktop(
                                      number: (index + 1).toString(),
                                      video: state.playlists[0].videos[index],
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 5.h,
                                    ),
                                itemCount:
                                    state.playlists[0].videos.length - 1),
                          ),
                          // child: Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     const KVideoItemdesktop(
                          //       number: '1',
                          //     ),
                          //     SizedBox(height: 5.h),
                          //     const KVideoItemdesktop(
                          //       number: '2',
                          //     ),
                          //     SizedBox(height: 5.h),
                          //     const KVideoItemdesktop(
                          //       number: '3',
                          //     ),
                          //     SizedBox(height: 5.h),
                          //     const KVideoItemdesktop(
                          //       number: '4',
                          //     ),
                          //     SizedBox(height: 5.h),
                          //     const KVideoItemdesktop(
                          //       number: '5',
                          //     ),
                          //   ],
                          // ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Keep Watching',
                          style: TextStyle(
                            color: const Color(0xFF088AC6),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          height: 200.h,
                          // height: double.infinity,
                          width: 250.w,
                          child: Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    KVideoItemdesktop(
                                      number: (index + 1).toString(),
                                      video: state.playlists[0].videos[index],
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 5.h,
                                    ),
                                itemCount:
                                    state.playlists[0].videos.length - 1),
                          ),
                        )
                        // Column(
                        //   children: [
                        //     const KVideoItemdesktop(
                        //       number: '1',
                        //     ),
                        //     SizedBox(height: 5.h),
                        //     const KVideoItemdesktop(
                        //       number: '2',
                        //     ),
                        //     SizedBox(height: 5.h),
                        //     const KVideoItemdesktop(
                        //       number: '3',
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
