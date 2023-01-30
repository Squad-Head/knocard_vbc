import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/domain/image_video/post_data.dart';

import 'post_view_body.dart';

class PostListView extends ConsumerWidget {
  const PostListView({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<PostData> posts;

  @override
  Widget build(BuildContext context, ref) {
    return ListView.separated(
        itemCount: posts.length,
        separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: const Divider(
                color: Colors.black12,
              ),
            ),
        itemBuilder: (context, index) {
          return PostViewBody(post: posts[index]);
        });
  }
}
