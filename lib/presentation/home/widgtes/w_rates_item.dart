import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class WRatesItem extends StatelessWidget {
  const WRatesItem({
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
      // height: 180.h,
      // width: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
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
      child: AspectRatio(
        aspectRatio: 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // width: 160.w,
              padding: EdgeInsets.symmetric(vertical: 10.w),
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
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    Container(
                      height: 2.h,
                      width: 40.w,
                      color: const Color(0xFFAFAFAF),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Icon(
                          icon1,
                          size: 9.sp,
                          color: iconColor1,
                        ),
                        SizedBox(width: 5.w),
                        Flexible(
                          child: Text(
                            'Sample Text Here',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF666666),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Icon(
                          icon2,
                          size: 9.sp,
                          color: iconColor2,
                        ),
                        SizedBox(width: 8.w),
                        Flexible(
                          child: Text(
                            'Other Text Title',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF666666),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(
                          icon3,
                          size: 9.sp,
                          color: iconColor3,
                        ),
                        SizedBox(width: 5.w),
                        Flexible(
                          child: Text(
                            'Text Space Goes Here',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          icon4,
                          size: 9.sp,
                          color: iconColor4,
                        ),
                        SizedBox(width: 5.w),
                        Flexible(
                          child: Text(
                            'Description Space',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF666666),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 2.h,
                      width: 40.w,
                      color: const Color(0xFFAFAFAF),
                    ),
                    SizedBox(height: 5.h),
                    Flexible(
                      child: Text(
                        buttomText,
                        maxLines: 1,
                        style: TextStyle(
                          color: buttomTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
