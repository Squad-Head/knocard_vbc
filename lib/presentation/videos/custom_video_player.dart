import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widget_visibility_detector/widget_visibility_detector.dart';

import 'network_video_player.dart';

class CustomVideoPlayer extends HookConsumerWidget {
  final String videoUrl;
  final String thumbnail;
  const CustomVideoPlayer(
      {Key? key, required this.videoUrl, required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final tapped = useState(thumbnail.isEmpty);

    if (!tapped.value) {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(thumbnail))),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    tapped.value = true;
                  },
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
      return WidgetVisibilityDetector(
        onDisappear: () {
          tapped.value = false;
        },
        child: NetworkVideoPlayer(
          videoUrl,
          autoPlay: thumbnail.isNotEmpty,
        ),
      );
    }
  }
}
