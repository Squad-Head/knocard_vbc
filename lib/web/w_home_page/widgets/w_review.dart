import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                color: const Color(0xFF020714),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '2 months ago',
              style: TextStyle(
                color: const Color(0xFF9C9B9E),
                fontSize: 12,
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.32,
              child: RichText(
                text: TextSpan(
                  text: text2,
                  style: TextStyle(
                    fontSize: 10,
                    color: const Color(0xFF020714),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: text3,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: const Color(0xFF8065C6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.solidThumbsUp,
                  size: 9,
                  color: const Color(0xFFA3A3A3),
                ),
                SizedBox(width: 3),
                Text(
                  'Helpful?',
                  style: TextStyle(
                    fontSize: 10,
                    color: const Color(0xFFA3A3A3),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  height: 17,
                  width: 2,
                  color: const Color(0xFFA3A3A3),
                ),
                SizedBox(width: 3),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: RichText(
                        text: TextSpan(
                          text: 'Response from the owner ',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF020714),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'a month ago',
                              style: TextStyle(
                                fontSize: 9,
                                color: const Color(0xFFA3A3A3),
                              ),
                            ),
                            TextSpan(
                              text: text4,
                              style: TextStyle(
                                fontSize: 10,
                                color: const Color(0xFF020714),
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
