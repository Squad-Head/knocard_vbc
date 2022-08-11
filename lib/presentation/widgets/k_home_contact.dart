import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KHomeContact extends StatelessWidget {
  const KHomeContact({Key? key, required this.icon, required this.text})
      : super(key: key);
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      // height: 20.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: icon,
            padding: EdgeInsets.zero,
            iconSize: 50.sp,
            color: const Color(0xFF088AC6),
            onPressed: () {},
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xFF7A7C79),
                fontSize: 50.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
