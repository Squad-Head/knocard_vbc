import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WReview extends StatelessWidget {
  const WReview(
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
                color: Color(0xFF020714),
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '2 months ago',
              style: TextStyle(
                color: Color(0xFF9C9B9E),
                fontSize: 12.sp,
              ),
            ),
            RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 10.sp,
              itemPadding: const EdgeInsets.all(2),
              itemBuilder: (context, _) => const Icon(
                FontAwesomeIcons.solidStar,
                color: Color(0xFFE97100),
              ),
              onRatingUpdate: (rating) {},
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 300.w),
              // width: MediaQuery.of(context).size.width * 0.32,
              child: RichText(
                maxLines: 4,
                text: TextSpan(
                  text: text2,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xFF020714),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: text3,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: const Color(0xFF8065C6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: const [
                Icon(
                  FontAwesomeIcons.solidThumbsUp,
                  size: 9,
                  color: Color(0xFFA3A3A3),
                ),
                SizedBox(width: 3),
                Text(
                  'Helpful?',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFA3A3A3),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  height: 17,
                  width: 2,
                  color: const Color(0xFFA3A3A3),
                ),
                const SizedBox(width: 3),
                Column(
                  children: [
                    SizedBox(
                      width: 300.w,
                      child: RichText(
                        text: TextSpan(
                          text: 'Response from the owner ',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF020714),
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'a month ago',
                              style: TextStyle(
                                fontSize: 9,
                                color: Color(0xFFA3A3A3),
                              ),
                            ),
                            TextSpan(
                              text: text4,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF020714),
                              ),
                            ),
                          ],
                        ),
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
