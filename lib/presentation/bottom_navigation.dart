import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          height: 65.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home),
            const Icon(Icons.history),
            Container(
              height: 100.h,
              width: 80.w,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Icon(Icons.light),
            ),
            const Icon(Icons.phone),
            const Icon(Icons.book),
          ],
        ),
      ],
    );
  }
}
