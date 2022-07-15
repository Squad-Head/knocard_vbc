import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WHomeContact extends StatelessWidget {
  const WHomeContact({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20.sp,
          color: const Color(0xFF088AC6),
        ),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF7A7C79),
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
