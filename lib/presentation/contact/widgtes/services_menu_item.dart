import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesMenuItem extends StatelessWidget {
  const ServicesMenuItem({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Row(
        children: [
          Icon(
            icon,
            size: 15.sp,
            color: const Color(0xFF088AC6),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF525252),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
