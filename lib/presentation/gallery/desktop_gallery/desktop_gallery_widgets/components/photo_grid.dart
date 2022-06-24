import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/photo.dart';

class PhotoGrid extends HookConsumerWidget {
  const PhotoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final photos = ref.watch(
        profileProvider.select((value) => value.userProfile.photo_galleries));

    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
        ),
        itemCount: photos.length,
        itemBuilder: (BuildContext ctx, int index) {
          return imageBuild(photos[index]);
        });
  }

  Widget imageBuild(Photo photo) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(photo.title),
          ),
          Expanded(
            child: Image.asset(
              photo.link,
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
}
