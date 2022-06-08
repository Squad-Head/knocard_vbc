import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

class NetworkVideoPlayer extends HookWidget {
  final String url;
  final bool looping;
  final bool autoPlay;

  const NetworkVideoPlayer(this.url,
      {Key? key, this.looping = false, this.autoPlay = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoPlayerController =
        useMemoized(() => VideoPlayerController.network(url));

    final controller = useMemoized(() => ChewieController(
          showControlsOnInitialize: false,
          placeholder: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              )),
          videoPlayerController: videoPlayerController,
          aspectRatio: 16 / 9,
          autoInitialize: true,
          allowFullScreen: false,
          autoPlay: autoPlay,
          looping: looping,
        ));

    useEffect(() {
      return () {
        videoPlayerController.dispose();
        controller.dispose();
      };
    });
    return Chewie(
      controller: controller,
    );
  }
}
