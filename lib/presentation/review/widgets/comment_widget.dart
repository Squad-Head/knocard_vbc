import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 3.h,
          color: const Color(0xffDBDBDD),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20.w),
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 15.sp,
            ),
            SizedBox(width: 20.w),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //const SizedBox(width: 10),
                    Text(
                      "Hasan Rahman",
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10.w),
                    SmoothStarRating(
                      starCount: 5,
                      color: Color(0xffFFB924),
                      borderColor: Color(0xffFFB924),
                      //   isReadOnly: true,
                      rating: 5,
                      //  spacing: 0.0,
                      size: 14.sp,
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      "Bangladesh",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  "Lorem Ipsum is simply dummy text ",
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ],
        )
      ],
    );
  }
}
