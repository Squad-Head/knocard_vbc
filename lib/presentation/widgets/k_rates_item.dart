import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KRatesItem extends StatelessWidget {
  const KRatesItem({
    Key? key,
    required this.containerColor,
    required this.headTextColor,
    required this.iconColor1,
    required this.iconColor2,
    required this.iconColor3,
    required this.iconColor4,
    required this.buttomTextColor,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.icon4,
    required this.headText,
    required this.buttomText,
  }) : super(key: key);
  final Color containerColor;
  final Color headTextColor;
  final Color iconColor1;
  final Color iconColor2;
  final Color iconColor3;
  final Color iconColor4;
  final Color buttomTextColor;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final IconData icon4;
  final String headText;
  final String buttomText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 291.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFAFAFAF),
            offset: Offset(-3, 3),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 30.h,
            width: 291.w,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                headText,
                style: TextStyle(
                    color: headTextColor,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 1.h,
                  width: 60.w,
                  color: const Color(0xFFAFAFAF),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(
                      icon1,
                      size: 30.sp,
                      color: iconColor1,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Sample Text Here',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(
                      icon2,
                      size: 30.sp,
                      color: iconColor2,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Other Text Title',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(
                      icon3,
                      size: 30.sp,
                      color: iconColor3,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Text Space Goes Here',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(
                      icon4,
                      size: 30.sp,
                      color: iconColor4,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Description Space',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 1.h,
                  width: 60.w,
                  color: const Color(0xFFAFAFAF),
                ),
                SizedBox(height: 5.h),
                Text(
                  buttomText,
                  style: TextStyle(
                    color: buttomTextColor,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
