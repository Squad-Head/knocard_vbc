import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KHomeMenuItem extends StatelessWidget {
  const KHomeMenuItem({Key? key, required this.icon, required this.text})
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
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF525252),
            fontSize: 30.sp,
          ),
        ),
      ],
    );
  }
}
