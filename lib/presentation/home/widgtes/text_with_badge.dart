import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/color.dart';

class TextWithBadge extends StatelessWidget {
  const TextWithBadge({
    Key? key,
    required this.badgeText,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  final String badgeText, text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          margin: EdgeInsets.only(right: 12.w, top: 5),
          decoration: BoxDecoration(
            color: KColor.backgroundColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 2.5,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? KColor.primaryColor : Colors.grey.shade400,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(5.w),
            width: 30.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xfffe0c2e),
              shape: BoxShape.circle,
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
