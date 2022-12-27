import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/reporting_provider.dart';
import 'package:knocard_ui/domain/activity_data.dart';
import 'package:knocard_ui/domain/profile/profile_video.dart';
import 'package:knocard_ui/infrastructure/youtube_util.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:widget_visibility_detector/widget_visibility_detector.dart';

import 'desktop_video/youtube_video_player.dart';
import 'network_video_player.dart';

class ProfileVideoPlayer extends HookConsumerWidget {
  final ProfileVideo video;
  const ProfileVideoPlayer({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final tapped = useState(false);
    // final profile =
    //     ref.watch(profileProvider.select((value) => value.userProfile));
    // final shareCode =
    //     ref.watch(profileProvider.select((value) => value.shareCode));
    if (!tapped.value) {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        YoutubeUtil.videoThumbnail(video)))),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    // ReportingRepo.trackPlaylistView(
                    //     id: profile.id,
                    //     videoId: video.id,
                    //     shareCode: shareCode);
                    if (video.platform == 'youtube') {
                      if (await canLaunchUrlString(
                          'https://youtu.be/${video.link}')) {
                        launchUrlString('https://youtu.be/${video.link}');
                      }
                    } else {
                      tapped.value = true;
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
      return WidgetVisibilityDetector(
        onDisappear: () {
          tapped.value = false;
        },
        child: ReportedVideoPlayer(video: video),
      );
    }
  }
}

class ReportedVideoPlayer extends ConsumerWidget {
  final ProfileVideo video;
  const ReportedVideoPlayer({super.key, required this.video});

  @override
  Widget build(BuildContext context, ref) {
    final data = ActivityData(
        viewableId: 25,
        actionType: 'view',
        sourceType: 'link_share',
        module: Module.videos,
        targetId: video.user_id,
        identifiableId: video.id);
    final activitySaver = ref.watch(saveReportingProvider(data));
    return activitySaver.maybeWhen(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        orElse: () => video.platform == 'youtube'
            ? YoutubeVideoPlayer(video.link)
            : NetworkVideoPlayer(video.link));
  }
}
