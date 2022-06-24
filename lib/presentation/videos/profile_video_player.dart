import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:knocard_ui/domain/profile/profile_video.dart';

import 'network_video_player.dart';

class ProfileVideoPlayer extends HookWidget {
  final ProfileVideo video;
  const ProfileVideoPlayer({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tapped = useState(false);
    if (!tapped.value) {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(video.thumbnail))),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => tapped.value = true,
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white30,
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ));
    } else {
      return NetworkVideoPlayer(video.link);
    }
  }
}
