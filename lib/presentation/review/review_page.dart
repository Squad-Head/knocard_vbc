import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/presentation/widgets/k_network_image.dart';

import '../widgets/k_navbar.dart';

class ReviewPage extends HookConsumerWidget {
  const ReviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: .5,
                    ),
                  ],
                ),
                child: const KNavbar(),
              ),

              // Review Table
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
                    margin:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(2, 2),
                          blurRadius: 3,
                          spreadRadius: .5,
                        ),
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(-2, -2),
                          blurRadius: 3,
                          spreadRadius: .5,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        _reviewItem("71.42%", 1800, 5, .7),
                        _reviewItem("28.42%", 30, 4, .3),
                        _reviewItem("14.28%", 1, 3, .17),
                        _reviewItem("14.28%", 1, 2, .17),
                        _reviewItem("00.00%", 0, 1, 0),
                      ],
                    ),
                  ),

                  //Comment section

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            RatingBarIndicator(
                              rating: 5,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                              ),
                              itemCount: 5,
                              itemSize: 12,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              '5',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              '(1832)',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'Most Relevent',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 14.sp,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const Divider(),

                        //Comment List

                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: KNetwokImage(
                                  imgUrl: 'https://i.pravatar.cc/300',
                                  height: 24,
                                  width: 24,
                                ),
                                radius: 12.r,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Name & Stars

                                  Row(
                                    children: [
                                      Text(
                                        'victoriabudvar',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      RatingBarIndicator(
                                        rating: 5,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Color(0xfffeb13e),
                                        ),
                                        itemCount: 5,
                                        itemSize: 12,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        '5',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 5.h,
                                  ),

                                  //Country

                                  Row(
                                    children: [
                                      KNetwokImage(
                                        imgUrl:
                                            'https://th.bing.com/th/id/R.a3aa863098cadde7811d060c19a577a5?rik=a1xPKyiA6awcbw&pid=ImgRaw&r=0',
                                        height: 12,
                                        width: 15,
                                        borderRadius: 0,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "United States",
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(.8),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  //Comment

                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    width: 280.w,
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ac feugiat dui. Duis fermentum, ex eu luctus rhoncus, sapien urna faucibus elit, eget facilisis nunc turpis in mi.',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Text(
                                    'Published 2 months ago',
                                    style: TextStyle(
                                      color: Colors.grey.withOpacity(.5),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 40.h,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: const Divider(),
                              ),
                            ),
                          ),
                          itemCount: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _reviewItem(
      String percent, int reviews, double stars, double progress) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                percent,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff96969a),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "$reviews Reviews",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              RatingBarIndicator(
                rating: stars,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                itemCount: stars.toInt(),
                itemSize: 16,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          LinearProgressIndicator(
            value: progress,
          )
        ],
      ),
    );
  }
}
