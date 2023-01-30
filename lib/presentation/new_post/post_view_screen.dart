import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/domain/image_video/post_data.dart';

import 'post_view_body.dart';

class PostViewScreen extends HookConsumerWidget {
  final PostData post;
  const PostViewScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.grey),
          title: const Text(
            "Post",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            PostViewBody(post: post),
            Divider(
              color: Colors.black12,
              height: 20.h,
            )
          ],
        ));
  }
}
