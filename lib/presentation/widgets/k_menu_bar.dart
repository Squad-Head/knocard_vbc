import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KMenuBar extends StatelessWidget {
  const KMenuBar({Key? key, required this.icon, required this.text})
      : super(key: key);
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: icon,
          iconSize: 25,
          color: const Color(0xFF088AC6),
          onPressed: () {},
        ),
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF4E4E4E),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
