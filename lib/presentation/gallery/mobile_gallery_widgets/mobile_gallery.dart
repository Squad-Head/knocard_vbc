import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/presentation/gallery/gallery_image_view.dart';

class MobileGalleryPage extends ConsumerWidget {
  const MobileGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final photos = ref.watch(
        profileProvider.select((value) => value.userProfile.photo_galleries));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     KAlbums(image: 'assets/images/album.png', text: 'Album 1'),
              //     KAlbums(image: 'assets/images/album2.png', text: 'Album 2'),
              //     KAlbums(image: 'assets/images/album3.png', text: 'Album 3'),
              //     KAlbums(image: 'assets/images/album4.png', text: 'Album 4'),
              //   ],
              // ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.post_add_sharp),
                  Icon(
                    Icons.crop_square,
                    color: Color(0xFF9A9A9A),
                  ),
                  Icon(
                    Icons.account_box,
                    color: Color(0xFF9A9A9A),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 600,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GalleryImageViewPage(
                                        index: index,
                                      )));
                        },
                        child: Image(
                          image: NetworkImage(photos[index].link),
                        ),
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
      ),
    );
  }
}
