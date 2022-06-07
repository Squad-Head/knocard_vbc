import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../widgets/comment_widget.dart';
import '../widgets/review.dart';

class DesktopReviewPage extends StatelessWidget {
  const DesktopReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.sp),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(height: 80.h),
                  SizedBox(
                    width: 400.w,
                    child: const ReviewWidget(),
                  ),
                  const Divider(),
                  SizedBox(width: 30.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Reviews",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff222222),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                SmoothStarRating(
                                  starCount: 5,
                                  color: Color(0xffFFB924),
                                  borderColor: Color(0xffFFB924),
                                  //   isReadOnly: true,
                                  rating: 5,
                                  //  spacing: 0.0,
                                  size: 20.sp,
                                ),
                                Text(
                                  "(12223)",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff222222),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Most Relevant",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff222222),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  size: 30.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            CommentWidget(),
                            CommentWidget(),
                            CommentWidget(),
                            CommentWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
