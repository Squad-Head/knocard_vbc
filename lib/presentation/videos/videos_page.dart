import 'package:flutter/material.dart';
import 'package:knocard_ui/presentation/videos/desktop_video/desktop_videos.dart';
import 'package:knocard_ui/presentation/videos/mobile_video_page/mobile_video_player.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width > 700) {
        return const DesktopVideoPage();
      } else {
        return const MobileVideosPage();
      }
    });
  }
}
