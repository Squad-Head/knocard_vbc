import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/presentation/videos/profile_video_player.dart';

class MobileVideosPage extends HookConsumerWidget {
  const MobileVideosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(profileProvider).userProfile;
    final selectedVideo = useState(0);
    final selectedPlaylist = useState(0);
    final videoScrollController = useScrollController();
    final playlistScrollController = useScrollController();
    final controller = usePageController(keepPage: false);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.playlists[selectedPlaylist.value].videos.isEmpty
                        ? ''
                        : state.playlists[selectedPlaylist.value]
                            .videos[selectedVideo.value].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_downward,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 220,
              width: double.infinity,
              color: Theme.of(context).shadowColor,
              child: state.playlists[selectedPlaylist.value].videos.isEmpty
                  ? Text(
                      'No Video Available',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).canvasColor,
                      ),
                    )
                  : PageView.builder(
                      controller: controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ProfileVideoPlayer(
                          video: state
                              .playlists[selectedPlaylist.value].videos[index],
                        );
                      }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Row(
                children: const [
                  Text(
                    "Playlist",
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  Text(
                    "Autoplay",
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  Icon(Icons.play_arrow_outlined),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Videos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 130,
                child: state.playlists[selectedPlaylist.value].videos.isEmpty
                    ? const Center(child: Text('Empty Playlist'))
                    : ListView.builder(
                        controller: videoScrollController,
                        itemCount: state
                            .playlists[selectedPlaylist.value].videos.length,
                        itemBuilder: (context, index) {
                          final video =
                              state.playlists[selectedPlaylist.value].videos;
                          return InkWell(
                            onTap: () {
                              selectedVideo.value = index;
                              controller.jumpToPage(index);
                            },
                            child: Material(
                              elevation: selectedVideo.value == index ? 10 : 0,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                width: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 3 / 2,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Container(
                                                  color: Colors.blue,
                                                ),
                                                imageUrl:
                                                    video[index].thumbnail,
                                                height: 100,
                                                width: 125,
                                              )),
                                          Positioned(
                                            bottom: 5,
                                            child: Container(
                                              height: 3,
                                              width: 112,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Container(
                                              height: 3,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: Colors.black38,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      video[index].title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 40),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Playlists",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 110.h,
                child: ListView.builder(
                  controller: playlistScrollController,
                  itemCount: state.playlists.length,
                  itemBuilder: (context, index) {
                    final playlists = state.playlists;
                    return InkWell(
                      onTap: () {
                        selectedPlaylist.value = index;

                        if (selectedPlaylist.value != index) {
                          selectedVideo.value = 0;
                          controller.jumpToPage(0);
                        }
                      },
                      child: Material(
                        elevation: selectedPlaylist.value == index ? 10 : 0,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          // height: 100.h,
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: playlists[index].description,
                                    height: 90.h,
                                    width: 140,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                playlists[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
