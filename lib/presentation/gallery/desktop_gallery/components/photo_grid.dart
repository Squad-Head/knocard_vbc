import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/photo.dart';
import 'package:knocard_ui/presentation/gallery/desktop_gallery/desktop_gallery_widgets/desktop_image_view.dart';

class PhotoGrid extends ConsumerWidget {
  const PhotoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final photos = ref.watch(
        profileProvider.select((value) => value.userProfile.photo_galleries));

    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10.w,
          crossAxisCount: 5,
          mainAxisSpacing: 10,
        ),
        itemCount: photos.length,
        itemBuilder: (BuildContext ctx, int index) {
          return InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => DesktopImageView(
                          images: photos,
                          index: index,
                        ));
              },
              child: imageBuild(photos[index]));
        });
  }

  Widget imageBuild(Photo photo) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(photo.title),
          ),
          Expanded(
            child: Image.network(
              photo.link,
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
}
