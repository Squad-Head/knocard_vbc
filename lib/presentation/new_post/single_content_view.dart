import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knocard_ui/domain/image_video/content_data.dart';
import 'package:knocard_ui/presentation/videos/custom_video_player.dart';

class SingleContentView extends StatelessWidget {
  final ContentData content;
  const SingleContentView({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return content.isImage
        ? CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: content.isImage ? content.link : content.thumbnail)
        : CustomVideoPlayer(
            thumbnail: content.thumbnail,
            videoUrl: content.link,
          );
  }
}
