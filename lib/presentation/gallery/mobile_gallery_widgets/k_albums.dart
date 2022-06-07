import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAlbums extends StatelessWidget {
  const KAlbums({Key? key, required this.image, required this.text})
      : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: 60.h,
            width: 60.h,
            decoration: const BoxDecoration(
              color: Color(0xFFFEFEFC),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFDBDBDB),
                  offset: Offset.zero,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            text,
            style: TextStyle(color: const Color(0xFF000000), fontSize: 40.sp),
          ),
        ],
      ),
    );
  }
}
