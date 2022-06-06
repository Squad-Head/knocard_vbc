import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 3,
          color: Color(0xffDBDBDD),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 15,
            ),
            SizedBox(width: 20),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //const SizedBox(width: 10),
                    const Text(
                      "Hasan Rahman",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Bangladesh",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Lorem Ipsum is simply dummy text ",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        )
      ],
    );
  }
}
