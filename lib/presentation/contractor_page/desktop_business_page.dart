// ignore_for_file: prefer_const_declarations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_api/clean_api.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/company_provider.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/presentation/videos/custom_video_player.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DesktopBusinessPage extends HookConsumerWidget {
  const DesktopBusinessPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final company =
        ref.watch(profileProvider.select((value) => value.userProfile.company));
    final companyState = ref.watch(companyProvider(company.id));
    final shareCode =
        ref.watch(profileProvider.select((value) => value.shareCode));
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        ref.read(companyProvider(company.id).notifier).getFeed();
        CleanApi.instance.post(
            fromData: (json) => unit,
            body: {
              "user_id": ref.watch(
                  profileProvider.select((value) => value.userProfile.id)),
              "log_name": "viewed",
              "activity_code": "company_page",
              if (shareCode.isNotEmpty) 'viewer_code': shareCode
            },
            showLogs: true,
            endPoint: 'tracking/desktop/click/save');
      });
      return null;
    }, []);

    return Scaffold(
        body: Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 700.w),
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
                          style: TextStyle(
                            fontSize: 25.sp,
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
                            child: CustomVideoPlayer(
                                videoUrl: company.promotional_video,
                                thumbnail: company.thumbnail),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5),
                          child: Text(
                            company.description,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            children: List<Widget>.from(
                                companyState.buttons.map((element) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(
                                                  int.parse(element.color)),
                                              shape: const StadiumBorder()),
                                          onPressed: element.status == 'ACT'
                                              ? () {
                                                  launchUrlString(element.link);
                                                }
                                              : null,
                                          child: Text(element.title)),
                                    ))),
                          ),
                        ),

                        Divider(
                          thickness: 2,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        // SizedBox(
                        //   height: 40.h,
                        //   child: ListView.separated(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: 4,
                        //     separatorBuilder: (context, index) =>
                        //         SizedBox(
                        //       width: 10.w,
                        //     ),
                        //     itemBuilder: (context, index) =>
                        //         ChoiceChip(
                        //       avatar: const CircleAvatar(
                        //         backgroundColor: Colors.white,
                        //       ),
                        //       label: const Text("LINK"),
                        //       labelStyle: TextStyle(
                        //         fontWeight: FontWeight.w400,
                        //         color: Colors.white,
                        //         fontSize: 14.sp,
                        //       ),
                        //       labelPadding: EdgeInsets.symmetric(
                        //           horizontal: 10.w),
                        //       backgroundColor:
                        //           const Color(0xff20a0df),
                        //       selectedColor: const Color(0xff16729f),
                        //       pressElevation: 5,
                        //       selected: chipSelected.value == index,
                        //       onSelected: (value) {
                        //         chipSelected.value = index;
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    if (companyState.feeds.isNotEmpty)
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
                                if (content.image.isNotEmpty)
                                  Container(
                                    alignment: Alignment.center,
                                    // height: 160.h,
                                    child: CachedNetworkImage(
                                      imageUrl: content.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (content.title.isNotEmpty)
                                  Text(
                                    content.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      height: 1.3,
                                    ),
                                  ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      formatDate(content.createdAt,
                                          [M, ' ', d, ', ', yy]),
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  content.description,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
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
    ));
  }
}
