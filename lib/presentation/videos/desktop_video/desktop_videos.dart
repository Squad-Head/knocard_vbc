import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knocard_ui/presentation/videos/desktop_video/widgets/k_video_item.dart';

class DesktopVideoPage extends StatelessWidget {
  const DesktopVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 15, 4, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 520,
                      width: 720,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 400,
                            width: 720,
                            color: Colors.red,
                            child: Text(
                              'Youtube video here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Video Title',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.sp),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'view count : upload time',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.shareNodes,
                                    color: const Color(0xFF048AC6),
                                    size: 15.sp,
                                  ),
                                  Text(
                                    'Share',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Videos',
                          style: TextStyle(
                            color: const Color(0xFF088AC6),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const KVideoItemdesktop(
                              number: '1',
                            ),
                            SizedBox(height: 5.h),
                            const KVideoItemdesktop(
                              number: '2',
                            ),
                            SizedBox(height: 5.h),
                            const KVideoItemdesktop(
                              number: '3',
                            ),
                            SizedBox(height: 5.h),
                            const KVideoItemdesktop(
                              number: '4',
                            ),
                            SizedBox(height: 5.h),
                            const KVideoItemdesktop(
                              number: '5',
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Keep Watching',
                          style: TextStyle(
                            color: const Color(0xFF088AC6),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Column(
                          children: [
                            const KVideoItemdesktop(
                              number: '1',
                            ),
                            SizedBox(height: 5.h),
                            const KVideoItemdesktop(
                              number: '2',
                            ),
                            SizedBox(height: 5.h),
                            const KVideoItemdesktop(
                              number: '3',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
