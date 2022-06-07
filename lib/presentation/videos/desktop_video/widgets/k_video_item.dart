import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KVideoItem extends StatelessWidget {
  const KVideoItem({Key? key, required this.number}) : super(key: key);
  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          number,
          style: TextStyle(
            color: const Color(0xFF2A2A2A),
            fontSize: 8.sp,
          ),
        ),
        SizedBox(width: 2.w),
        const Image(
          image: AssetImage('assets/images/video1.png'),
          height: 60,
          width: 90,
        ),
        SizedBox(width: 2.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Get MORE With Time Blocking',
              style: TextStyle(
                color: const Color(0xFF2A2A2A),
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Matt Bayrom',
              style: TextStyle(
                color: const Color(0xFF878788),
                fontSize: 3.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
