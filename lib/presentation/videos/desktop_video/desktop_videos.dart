import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/presentation/videos/desktop_video/widgets/k_video_item.dart';
import 'package:knocard_ui/presentation/videos/desktop_video/widgets/playlist_card.dart';
import 'package:knocard_ui/presentation/videos/profile_video_player.dart';

class DesktopVideoPage extends HookConsumerWidget {
  const DesktopVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final playlists = ref.watch(profileProvider.select((value) => value
        .userProfile.playlists.lock
        .sort((a, b) => a.is_default.compareTo(b.is_default))));
    final selectPlaylist = useState(0);
    final selectedVideo = useState(0);
    final controller = usePageController(keepPage: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 15, 4, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 350.h,
                    width: 600.w,
                    color: Theme.of(context).shadowColor,
                    child: playlists[selectPlaylist.value].videos.isEmpty
                        ? Text(
                            'No Video Available',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).canvasColor,
                            ),
                          )
                        : PageView.builder(
                            controller: controller,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ProfileVideoPlayer(
                                video: playlists[selectPlaylist.value]
                                    .videos[index],
                              );
                            }),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            playlists[selectPlaylist.value].videos.isEmpty
                                ? ''
                                : playlists[selectPlaylist.value]
                                    .videos[selectedVideo.value]
                                    .title,
                            // 'Video Title',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              const Text(
                                'view count : ',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                playlists[selectPlaylist.value].videos.isEmpty
                                    ? ''
                                    : playlists[selectPlaylist.value]
                                        .videos[selectedVideo.value]
                                        .created_at
                                        .toString(),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.shareNodes,
                            color: Color(0xFF048AC6),
                            size: 15,
                          ),
                          Text(
                            'Share',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            Flexible(
              flex: 3,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const Text(
                    'Videos',
                    style: TextStyle(
                      color: Color(0xFF088AC6),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    child: playlists[selectPlaylist.value].videos.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              'Empty Playlist',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    controller.jumpToPage(index);
                                    selectedVideo.value = index;
                                  },
                                  child: KVideoItemdesktop(
                                    seleted: selectedVideo.value == index,
                                    number: (index + 1).toString(),
                                    video: playlists[selectPlaylist.value]
                                        .videos[index],
                                  ),
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 5.h,
                                ),
                            itemCount:
                                playlists[selectPlaylist.value].videos.length),
                  ),
                  SizedBox(height: 20.h),
                  const Text(
                    'Playlist',
                    style: TextStyle(
                      color: Color(0xFF088AC6),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        selectPlaylist.value = index;

                        if (selectPlaylist.value != index) {
                          controller.jumpTo(0);
                          selectedVideo.value = 0;
                        }
                      },
                      child: PlaylistCard(
                        selected: selectPlaylist.value == index,
                        number: (index + 1).toString(),
                        playlist: playlists[index],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5.h,
                    ),
                    itemCount: playlists.length,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
