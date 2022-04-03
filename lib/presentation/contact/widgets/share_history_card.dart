import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knocard_ui/style/color.dart';

class ShareHistoryCard extends StatelessWidget {
  const ShareHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      contentPadding: EdgeInsets.all(15.sp),
      content: SizedBox(
        width: 300.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: 90.w),
                Text(
                  'Share History',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'X',
                    style:
                        TextStyle(fontSize: 18.sp, color: KColor.primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 40.w,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: const Text('0'),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Daily',
                      style: GoogleFonts.lato(
                        fontSize: 12.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Container(
                      height: 40.w,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: const Text('0'),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Month',
                      style: GoogleFonts.lato(
                        fontSize: 12.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Container(
                      height: 40.w,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: const Text('7'),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Total',
                      style: GoogleFonts.lato(
                        fontSize: 12.sp,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Last Share',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '14/02/2020',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Last Sync',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '8/1/2022',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
