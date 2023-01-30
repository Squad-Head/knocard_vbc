import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/image_video/post_data.dart';

import 'multi_content_view.dart';
import 'single_content_view.dart';

class PostViewBody extends HookConsumerWidget {
  const PostViewBody({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostData post;

  @override
  Widget build(BuildContext context, ref) {
    final user =
        ref.watch(profileProvider.select((value) => value.userProfile));
    // final liked = useState(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundImage:
                    CachedNetworkImageProvider(user.profile_picture),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                user.name,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Spacer(),
              PopupMenuButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                        .copyWith(topRight: const Radius.circular(0))),
                padding: const EdgeInsets.all(10),
                elevation: 10,
                color: Colors.grey.shade100,
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                  size: 20.sp,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      value: 1,
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                FontAwesomeIcons.penToSquare,
                                size: 15,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Divider()
                        ],
                      )),
                  PopupMenuItem(
                      value: 1,
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                FontAwesomeIcons.exclamation,
                                size: 15,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Report',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Divider()
                        ],
                      )),
                  PopupMenuItem(
                    value: 2,
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Icon(
                          FontAwesomeIcons.xmark,
                          size: 15,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        post.contents.length > 1
            ? MultiContentView(
                post: post,
              )
            : AspectRatio(
                aspectRatio: 1,
                child: SingleContentView(
                  content: post.contents.first,
                ),
              ),
        Padding(
          padding: EdgeInsets.only(left: 10.w, top: 10),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.eye,
                size: 15.sp,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "121 Views",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    // ContactFunctions.sendSMS(
                    //     '', 'Hello ! please check out my post: https://……');
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => ShareContactScreen(
                    //           isShare: true,
                    //           message:
                    //               ' “Hello ! please check out my post: https://……..”',
                    //         )));
                  },
                  child: Icon(
                    FontAwesomeIcons.shareNodes,
                    size: 15.sp,
                    color: Colors.orange,
                  )),
              const SizedBox(
                width: 5,
              ),
              Text(
                "121 Shares",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                post.description,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "3 December",
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
