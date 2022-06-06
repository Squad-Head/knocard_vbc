import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WHomeServices extends StatelessWidget {
  const WHomeServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 70.h,
                width: double.infinity,
                // color: Color(0xff63B4DB),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff1d92c8),
                  Color(0xffc1ddef),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                // child: Column(
                //   children: [
                //     Container(
                //       padding: EdgeInsets.symmetric(
                //           horizontal: 15.w, vertical: 5.h),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(15.r),
                //           bottomRight: Radius.circular(15.r),
                //         ),
                //         color: KColor.primaryColor,
                //         boxShadow: const [
                //           BoxShadow(
                //             color: Colors.black26,
                //             offset: Offset(-2, 2),
                //             blurRadius: 2,
                //             spreadRadius: .5,
                //           ),
                //         ],
                //       ),
                //       child: Text(
                //         "Dale's home service",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 18.sp,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ),
                //     SizedBox(height: 10.h),
                //     Container(
                //       padding: EdgeInsets.all(5.w),
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         border: Border.all(color: Colors.white),
                //       ),
                //       child: const CircleAvatar(
                //         backgroundImage: NetworkImage(
                //           'https://i.pravatar.cc/300',
                //         ),
                //         radius: 60,
                //       ),
                //     )
                //   ],
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
