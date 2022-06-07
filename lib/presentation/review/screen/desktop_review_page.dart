import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

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
                    width: 460.w,
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
                                    color: const Color(0xff222222),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                SmoothStarRating(
                                  starCount: 5,
                                  color: const Color(0xffFFB924),
                                  borderColor: const Color(0xffFFB924),
                                  //   isReadOnly: true,
                                  rating: 5,
                                  //  spacing: 0.0,
                                  size: 20.sp,
                                ),
                                Text(
                                  "(12223)",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff222222),
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
                                    color: const Color(0xff222222),
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
                          children: const [
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
              radius: 25.sp,
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
                          fontSize: 27.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10.w),
                    SmoothStarRating(
                      starCount: 5,
                      color: const Color(0xffFFB924),
                      borderColor: const Color(0xffFFB924),
                      //   isReadOnly: true,
                      rating: 5,
                      //  spacing: 0.0,
                      size: 24.sp,
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      "Bangladesh",
                      style: TextStyle(fontSize: 24.sp),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  "Lorem Ipsum is simply dummy text ",
                  style: TextStyle(fontSize: 24.sp),
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

class Rating extends StatelessWidget {
  final double rating;
  final double percentage;

  final String reviewNumber;

  const Rating({
    Key? key,
    required this.rating,
    required this.percentage,
    required this.reviewNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double percentageCovert = percentage / 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$percentage %",
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff949398),
              ),
            ),
            Text(
              reviewNumber,
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff222222),
              ),
            ),
            SmoothStarRating(
              starCount: 5,
              color: const Color(0xffFFB924),
              borderColor: const Color(0xffFFB924),
              //   isReadOnly: true,
              rating: rating,
              //  spacing: 0.0,
              size: 26.sp,
            )
          ],
        ),
        SizedBox(height: 20.h),
        LinearPercentIndicator(
          width: 260.0.h.w,
          lineHeight: 6.0,
          percent: percentageCovert,
          backgroundColor: const Color(0xffBEBDC2),
          progressColor: const Color(0xff0889C6),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.h,
      child: Padding(
        padding: EdgeInsets.all(0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reviews",
              style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff0B8AC6)),
            ),
            SizedBox(height: 30.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: const [
                Rating(
                    percentage: 71.32, rating: 5, reviewNumber: "1800 Reviews"),
                Rating(
                    percentage: 28.32, rating: 4, reviewNumber: "1800 Reviews"),
                Rating(
                    percentage: 14.32, rating: 3, reviewNumber: "1800 Reviews"),
                Rating(
                    percentage: 12.32, rating: 2, reviewNumber: "1800 Reviews"),
                Rating(
                    percentage: 10.32, rating: 1, reviewNumber: "1800 Reviews"),
              ],
            ),
          ],
        ),
      ),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: const Color(0xffF1F1F1)),
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
    );
  }
}
