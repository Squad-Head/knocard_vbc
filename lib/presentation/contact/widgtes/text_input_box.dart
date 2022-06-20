import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputBox extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const TextInputBox({
    required this.text,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(5.sp),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        height: 36.h,
        // width: 240.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child: Row(
          children: [
            Text(text),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
