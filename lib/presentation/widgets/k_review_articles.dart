import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KReviewArticles extends StatelessWidget {
  const KReviewArticles(
      {Key? key,
      required this.image,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4})
      : super(key: key);
  final String image;
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                color: const Color(0xFF020714),
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '2 months ago',
              style: TextStyle(
                color: const Color(0xFF9C9B9E),
                fontSize: 30.sp,
              ),
            ),
            RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 10,
              itemPadding: const EdgeInsets.all(2),
              itemBuilder: (context, _) => const Icon(
                FontAwesomeIcons.solidStar,
                color: Color(0xFFE97100),
              ),
              onRatingUpdate: (rating) {},
            ),
            RichText(
              text: TextSpan(
                text: text2,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: const Color(0xFF020714),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: text3,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: const Color(0xFF8065C6),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.solidThumbsUp,
                  size: 25.sp,
                  color: const Color(0xFFA3A3A3),
                ),
                SizedBox(width: 3.w),
                Text(
                  'Helpful?',
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: const Color(0xFFA3A3A3),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Container(
                  height: 20.h,
                  width: 2.w,
                  color: const Color(0xFFA3A3A3),
                ),
                SizedBox(width: 3.w),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Response from the owner ',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF020714),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'a month ago',
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: const Color(0xFFA3A3A3),
                            ),
                          ),
                          TextSpan(
                            text: text4,
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: const Color(0xFF020714),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
