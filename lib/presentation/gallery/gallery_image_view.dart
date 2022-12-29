import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/application/reporting_provider.dart';
import 'package:knocard_ui/domain/activity_data.dart';
import 'package:knocard_ui/domain/profile/photo.dart';
import 'package:knocard_ui/presentation/gallery/show_image.dart';

class GalleryImageViewPage extends HookConsumerWidget {
  final int index;
  final List<Photo> photos;
  const GalleryImageViewPage(
      {Key? key, required this.index, required this.photos})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final selectedIndex = useState(index);
    final controller = usePageController(initialPage: index);
    final state = ref.watch(profileProvider);
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        controller.addListener(() {
          selectedIndex.value = controller.page?.toInt() ?? 0;
        });
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
        title: Text(photos[selectedIndex.value].title),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
          ),
          color: Colors.black,
        ),
      ),
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
                        itemBuilder: (context, indx) => ShowImage(
                          photo: photos[indx],
                          currentUserId: 25,
                          userId: state.userProfile.id,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(photos[selectedIndex.value].description),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Icon(
                    //         FontAwesomeIcons.solidHeart,
                    //         color: Colors.red,
                    //         size: 20.sp,
                    //       ),
                    //       SizedBox(height: 10.h),
                    //       Text(
                    //         '21 likes',
                    //         style:
                    //             TextStyle(fontSize: 20.sp, color: Colors.black),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 600,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: photos.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: index == selectedIndex.value
                                        ? Colors.orange
                                        : const Color(0xFF000000))),
                            child: InkWell(
                              onTap: () {
                                controller.jumpToPage(index);
                              },
                              child: CachedNetworkImage(
                                imageUrl: photos[index].link,
                                fit: BoxFit.cover,
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
