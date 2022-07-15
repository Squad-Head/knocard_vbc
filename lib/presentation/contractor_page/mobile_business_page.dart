import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/company_provider.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';

class MobileBusinessPage extends HookConsumerWidget {
  const MobileBusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final company =
        ref.watch(profileProvider.select((value) => value.userProfile.company));
    final companyState = ref.watch(companyProvider(company.id));
    final videoPlayerController = useMemoized(
        () => VideoPlayerController.network(company.promotional_video));

    final controller = useMemoized(() => ChewieController(
          showControlsOnInitialize: false,
          placeholder: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              )),
          videoPlayerController: videoPlayerController,
          aspectRatio: 16 / 9,
          autoInitialize: true,
          allowFullScreen: false,
          autoPlay: false,
          looping: false,
        ));

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 200), () {
        ref.read(companyProvider(company.id).notifier).getFeed();
      });
      return null;
    }, []);

    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Text(
                            company.business_page_title,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          if (company.promotional_video.isNotEmpty)
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Chewie(
                                controller: controller,
                              ),
                            )
                          else
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: CachedNetworkImage(
                                imageUrl: company.profile_picture,
                                fit: BoxFit.cover,
                                // height: 160.h,
                              ),
                              // child: Image.network(weddingImage,
                              //     fit: BoxFit.cover),
                            ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  company.description,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Apr 30, 2022',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: List<ElevatedButton>.from(companyState
                                  .buttons
                                  .map((element) => ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Color(int.parse(element.color)),
                                          shape: const StadiumBorder()),
                                      onPressed: element.status == 'ACT'
                                          ? () {
                                              launchUrlString(element.link);
                                            }
                                          : null,
                                      child: Text(element.title)))),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: companyState.feeds.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 30.h,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final content = companyState.feeds[index];
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.w),
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(-4, 4),
                                  blurRadius: 4,
                                  spreadRadius: 1.5,
                                ),
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(1.5, -1.5),
                                  blurRadius: 2.r,
                                  spreadRadius: .5.r,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  // height: 160.h,
                                  child: content.image.isNotEmpty
                                      ? CachedNetworkImage(
                                          imageUrl: content.image,
                                          fit: BoxFit.cover,
                                        )
                                      : content.title.isNotEmpty
                                          ? Text(
                                              content.title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                                height: 1.3,
                                              ),
                                            )
                                          : const Text('Nothing to show'),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      content.title,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      formatDate(content.createdAt,
                                          [M, ' ', d, ', ', yy]),
                                      style: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  content.title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
