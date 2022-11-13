import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/collage_provider.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/presentation/gallery/gallery_image_view.dart';

class MobileGalleryPage extends HookConsumerWidget {
  const MobileGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final photos = ref.watch(
        profileProvider.select((value) => value.userProfile.photo_galleries));

    final collages = ref.watch(collageProvider);
    final shareCode =
        ref.watch(profileProvider.select((value) => value.shareCode));
    useEffect(() {
      Future.delayed(
          const Duration(
            milliseconds: 500,
          ), () {
        ref.read(collageProvider.notifier).loadCollage();
        CleanApi.instance.post(
            fromData: (json) => unit,
            body: {
              "user_id": ref.watch(
                  profileProvider.select((value) => value.userProfile.id)),
              "log_name": "viewed",
              "activity_code": "photo_gallery_page",
              if (shareCode.isNotEmpty) 'viewer_code': shareCode
            },
            showLogs: true,
            endPoint: 'tracking/desktop/click/save');
      });
      return null;
    }, []);

    return Scaffold(
        body: ListView(children: [
      if (collages.isNotEmpty)
        SizedBox(
          height: 110,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: collages.length,
              itemBuilder: (context, index) {
                final collage = collages[index];
                return collage.photoGallery.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GalleryImageViewPage(
                                        photos: collage.photoGallery,
                                        index: 0,
                                      )));
                        },
                        child: SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                      collages[index].photoGallery.first.link),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                collage.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              }),
        ),
      SizedBox(height: 10.h),
      SizedBox(
        width: double.infinity,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: photos.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                final data = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GalleryImageViewPage(
                              photos: photos,
                              index: index,
                            )));

                if (data ?? false) {
                  ref.read(collageProvider.notifier).loadCollage();
                }
              },
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: photos[index].link,
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
      ),
    ]));
  }
}
