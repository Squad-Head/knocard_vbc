import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../widgets/comment_widget.dart';
import '../widgets/review.dart';

class DesktopReviewPage extends StatelessWidget {
  const DesktopReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const ReviewWidget(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Reviews",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff222222),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SmoothStarRating(
                      starCount: 5,
                      color: Color(0xffFFB924),
                      borderColor: Color(0xffFFB924),
                      //   isReadOnly: true,
                      rating: 5,
                      //  spacing: 0.0,
                      size: 14,
                    ),
                    const Text(
                      "(12223)",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff222222),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Most Relevant",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff222222),
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  CommentWidget(),
                  CommentWidget(),
                  CommentWidget(),
                  CommentWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
