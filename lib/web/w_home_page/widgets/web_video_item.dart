import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebVideoItem extends StatelessWidget {
  const WebVideoItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '1',
          style: TextStyle(
            color: const Color(0xFF2A2A2A),
            fontSize: 7,
          ),
        ),
        SizedBox(width: 2),
        const Image(
          image: AssetImage('assets/images/video.png'),
        ),
        SizedBox(width: 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get MORE With Time Blocking',
              style: TextStyle(
                color: const Color(0xFF2A2A2A),
                fontSize: 4,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Matt Bayrom',
              style: TextStyle(
                color: const Color(0xFF878788),
                fontSize: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
