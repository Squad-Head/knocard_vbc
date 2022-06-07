import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/presentation/review/widgets/rating.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.h,
      child: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reviews",
              style: TextStyle(
                  fontSize: 22.sp,
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
