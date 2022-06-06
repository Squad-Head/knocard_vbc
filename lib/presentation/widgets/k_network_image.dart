import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import '../../../style/color.dart';

// ignore: must_be_immutable
class KNetwokImage extends StatelessWidget {
  KNetwokImage({
    Key? key,
    required this.imgUrl,
    this.height = 150,
    this.width = 150,
    this.borderRadius = 70,
  }) : super(key: key);

  final String imgUrl;
  double height, width, borderRadius;

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      image: imgUrl,
      imageCache: CachedNetworkImageProvider(imgUrl),
      height: height,
      width: width,
      duration: 1500,
      fitAndroidIos: BoxFit.cover,
      fitWeb: BoxFitWeb.cover,
      borderRadius: BorderRadius.circular(borderRadius),
      onLoading: const CircularProgressIndicator(
        color: KColor.secondaryColor,
      ),
      onError: const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
