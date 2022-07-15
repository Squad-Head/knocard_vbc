import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knocard_ui/domain/profile/photo.dart';

class MobileGalleryWidget extends StatelessWidget {
  final List<Photo> photos;
  const MobileGalleryWidget({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: photos.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) => CachedNetworkImage(
        imageUrl: photos[index].link,
        fit: BoxFit.cover,
      ),
    );
  }
}
