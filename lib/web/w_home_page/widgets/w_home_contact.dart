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
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xFF088AC6),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF7A7C79),
            fontSize: 9.sp,
          ),
        ),
      ],
    );
  }
}
