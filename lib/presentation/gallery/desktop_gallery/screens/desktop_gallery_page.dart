import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/collage_provider.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/presentation/gallery/gallery_image_view.dart';

import '../components/photo_grid.dart';

class DesktopGalleryPage extends HookConsumerWidget {
  const DesktopGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final collages = ref.watch(collageProvider);
    useEffect(() {
      Future.delayed(
          const Duration(
            milliseconds: 100,
          ), () {
        ref.read(collageProvider.notifier).loadCollage();
        CleanApi.instance().post(
            fromJson: (json) => unit,
            body: {
              "user_id": ref.watch(
                  profileProvider.select((value) => value.userProfile.id)),
              "log_name": "viewed",
              "activity_code": "photo_gallery_page",
            },
            showLogs: true,
            endPoint: 'tracking/desktop/click/save');
      });
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 900,
          ),
          child: ListView(shrinkWrap: true, children: <Widget>[
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
                                        builder: (context) =>
                                            GalleryImageViewPage(
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
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                collages[index]
                                                    .photoGallery
                                                    .first
                                                    .link),
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
            // Albumtab(),
            const PhotoGrid(),
          ]),
        ),
      ),
    );
  }
}
