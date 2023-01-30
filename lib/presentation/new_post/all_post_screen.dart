import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/image_video/image_video_provider.dart';

import 'all_post_grid_view.dart';
import 'all_post_list_view.dart';

class AllPostScreen extends HookConsumerWidget {
  const AllPostScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        ref.read(imagePostProvider.notifier).getPostData();
      });
      return null;
    }, []);

    final posts =
        ref.watch(imagePostProvider.select((value) => value.imageVideoData));
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              indicatorColor: Colors.orange,
              tabs: [
                Tab(
                    icon: Icon(
                  FontAwesomeIcons.hashtag,
                  size: 15.sp,
                )),
                Tab(
                    icon: Icon(
                  FontAwesomeIcons.list,
                  size: 15.sp,
                )),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PostGridView(posts: posts),
                  PostListView(posts: posts),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
