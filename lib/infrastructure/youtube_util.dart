import 'package:knocard_ui/domain/profile/profile_video.dart';

class YoutubeUtil {
  YoutubeUtil._();

  static String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();

    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      Match? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }

    return null;
  }

  static String getThumbnail({
    required String videoId,
    bool webp = true,
  }) =>
      webp
          ? 'https://i3.ytimg.com/vi_webp/$videoId/sddefault.webp'
          : 'https://i3.ytimg.com/vi/$videoId/sddefault.jpg';

  static String videoThumbnail(ProfileVideo video) => video.thumbnail.isNotEmpty
      ? video.thumbnail
      : video.platform == 'youtube'
          ? YoutubeUtil.getThumbnail(videoId: video.link)
          : '';
}
