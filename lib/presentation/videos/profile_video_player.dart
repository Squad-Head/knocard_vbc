import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/profile_video.dart';
import 'package:knocard_ui/infrastructure/reporting_repo.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'network_video_player.dart';

class ProfileVideoPlayer extends HookConsumerWidget {
  final ProfileVideo video;
  const ProfileVideoPlayer({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final tapped = useState(false);
    final profile =
        ref.watch(profileProvider.select((value) => value.userProfile));
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
                  onTap: () async {
                    if (video.platform == 'youtube') {
                      if (await canLaunchUrlString(
                          'https://youtu.be/${video.link}')) {
                        launchUrlString('https://youtu.be/${video.link}');
                      }
                    } else {
                      tapped.value = true;
                      ReportingRepo.trackPlaylistView(
                          id: profile.id, videoId: video.id);
                    }
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
      return NetworkVideoPlayer(video.link);
    }
  }
}
