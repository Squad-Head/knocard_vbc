import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/presentation/videos/desktop_video/widgets/k_video_item.dart';
import 'package:knocard_ui/presentation/videos/desktop_video/widgets/playlist_card.dart';
import 'package:knocard_ui/presentation/videos/network_video_player.dart';

class DesktopVideoPage extends HookConsumerWidget {
  const DesktopVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(profileProvider).userProfile;
    final selectPlaylist = useState(0);
    final selectedVideo = useState(0);
    final videoScrollController = useScrollController();
    final playlistScrollController = useScrollController();
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
                            alignment: Alignment.center,
                            height: 400.h,
                            width: 600.w,
                            color: Theme.of(context).shadowColor,
                            child: state.playlists[selectPlaylist.value].videos
                                    .isEmpty
                                ? Text(
                                    'No Video Available',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  )
                                : NetworkVideoPlayer(
                                    state.playlists[selectPlaylist.value]
                                        .videos[selectedVideo.value].link,
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
                                    state.playlists[selectPlaylist.value].videos
                                            .isEmpty
                                        ? ''
                                        : state.playlists[selectPlaylist.value]
                                            .videos[selectedVideo.value].title,
                                    // 'Video Title',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.sp),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      Text(
                                        'view count : ',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp),
                                      ),
                                      Text(
                                        state.playlists[selectPlaylist.value]
                                                .videos.isEmpty
                                            ? ''
                                            : state
                                                .playlists[selectPlaylist.value]
                                                .videos[selectedVideo.value]
                                                .created_at
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp),
                                      ),
                                    ],
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
                          height: 300.h,
                          width: 350.w,
                          child: state.playlists[selectPlaylist.value].videos
                                  .isEmpty
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    'Empty Playlist',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: ListView.separated(
                                      controller: videoScrollController,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              selectedVideo.value = index;
                                            },
                                            child: KVideoItemdesktop(
                                              seleted:
                                                  selectedVideo.value == index,
                                              number: (index + 1).toString(),
                                              video: state
                                                  .playlists[
                                                      selectPlaylist.value]
                                                  .videos[index],
                                            ),
                                          ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                      itemCount: state
                                          .playlists[selectPlaylist.value]
                                          .videos
                                          .length),
                                ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Playlist',
                          style: TextStyle(
                            color: const Color(0xFF088AC6),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          height: 200.h,
                          width: 350.w,
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Expanded(
                            child: ListView.separated(
                              controller: playlistScrollController,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  if (selectPlaylist.value != index) {
                                    selectedVideo.value = 0;
                                  }
                                  selectPlaylist.value = index;
                                },
                                child: PlaylistCard(
                                  selected: selectPlaylist.value == index,
                                  number: (index + 1).toString(),
                                  playlist: state.playlists[index],
                                ),
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 5.h,
                              ),
                              itemCount: state.playlists.length,
                            ),
                          ),
                        )
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
