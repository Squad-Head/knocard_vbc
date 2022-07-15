import 'package:cached_network_image/cached_network_image.dart';
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
    useEffect(() {
      Future.delayed(
          const Duration(
            milliseconds: 100,
          ), () {
        ref.read(collageProvider.notifier).loadCollage();
      });
      return null;
    }, []);

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    if (collages.isNotEmpty)
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
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
                                                    photos:
                                                        collage.photoGallery,
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
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 600,
                width: double.infinity,
                child: GridView.builder(
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
            ],
          ),
        ),
      ]),
    )));
  }
}
