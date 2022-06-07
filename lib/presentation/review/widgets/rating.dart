import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff949398),
              ),
            ),
            Text(
              reviewNumber,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff222222),
              ),
            ),
            SmoothStarRating(
              starCount: 5,
              color: Color(0xffFFB924),
              borderColor: Color(0xffFFB924),
              //   isReadOnly: true,
              rating: rating,
              //  spacing: 0.0,
              size: 14.sp,
            )
          ],
        ),
        SizedBox(height: 20.h),
        LinearPercentIndicator(
          width: 260.0.h,
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
