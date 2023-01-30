import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:knocard_ui/domain/image_video/i_image_video_repo.dart';
import 'package:knocard_ui/domain/image_video/post_data.dart';

class ImageVideoRepo extends IImageVideoRepo {
  @override
  Future<List<PostData>> getpostData() async {
    final words = await rootBundle.loadString('assets/response.json');
    final data = json.decode(words);
    return List<PostData>.from(data["posts"].map((x) => PostData.fromMap(x)));
  }
}
