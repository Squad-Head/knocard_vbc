import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knocard_ui/domain/image_video/post_data.dart';

import 'post_view_screen.dart';

class PostGridView extends StatelessWidget {
  const PostGridView({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<PostData> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      children: List.generate(posts.length + 1, (index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => PostViewScreen(
                          post: posts[index],
                        )));
          },
          child: Container(
            height: 22.h,
            child: posts[index].contents.length > 1
                ? Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      FontAwesomeIcons.images,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                  )
                : posts[index].contents[0].type == 'video'
                    ? Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          FontAwesomeIcons.video,
                          color: Colors.white,
                          size: 15.sp,
                        ),
                      )
                    : const SizedBox(),
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(top: 12.h, right: 12.h),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        posts[index].contents[0].type == 'video'
                            ? posts[index].contents[0].thumbnail
                            : posts[index].contents[0].link),
                    fit: BoxFit.cover)),
          ),
        );
      }),
    );
  }
}
