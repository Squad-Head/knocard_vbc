import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';

class GalleryImageViewPage extends HookConsumerWidget {
  final int index;
  const GalleryImageViewPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final photos = ref.watch(
        profileProvider.select((value) => value.userProfile.photo_galleries));
    final controller = usePageController(initialPage: index);
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.white,
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 350.h,
                      child: PageView.builder(
                        itemCount: photos.length,
                        controller: controller,
                        itemBuilder: (context, indx) => Image(
                          image: NetworkImage(
                            photos[indx].link,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                            size: 25.sp,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            '21 likes',
                            style:
                                TextStyle(fontSize: 25.sp, color: Colors.black),
                          ),
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
                          return Card(
                            child: InkWell(
                              onTap: () {},
                              child: Image(
                                image: NetworkImage(
                                  photos[index].link,
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
