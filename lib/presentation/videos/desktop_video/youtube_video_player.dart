import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends HookWidget {
  final String videoId;
  final bool looping;
  final bool autoPlay;

  const YoutubeVideoPlayer(this.videoId,
      {Key? key, this.looping = false, this.autoPlay = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Logger.i('playing youtube video $videoId');
      return null;
    }, []);
    YoutubePlayerController controller =
        useMemoized(() => YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                  autoPlay: autoPlay,
                  hideControls: false,
                  disableDragSeek: false),
            ));

    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
    );
  }
}
