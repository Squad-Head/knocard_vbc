import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KHomeContact extends StatelessWidget {
  const KHomeContact({Key? key, required this.icon, required this.text})
      : super(key: key);
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: icon,
          iconSize: 18,
          color: const Color(0xFF088AC6),
          onPressed: () {},
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF7A7C79),
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
