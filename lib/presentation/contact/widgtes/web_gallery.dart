import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knocard_ui/domain/profile/photo.dart';

class WebGallery extends StatelessWidget {
  final List<Photo> photos;
  const WebGallery({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: photos.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) => Image(
        image: CachedNetworkImageProvider(photos[index].link),
        //image: AssetImage('images/image1.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }
}
