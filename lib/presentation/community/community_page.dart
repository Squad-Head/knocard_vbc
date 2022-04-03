import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/presentation/knocard_scaffold/knocard_scaffold.dart';
import 'package:knocard_ui/style/color.dart';

class CommuniyPage extends HookConsumerWidget {
  const CommuniyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final searchTap = useState(false);
    final filterTap = useState(false);
    final radiusTap = useState(false);
    final ratingsTap = useState(false);
    final sortTap = useState(false);
    final select = useState(4);
    // final selectTwo = useState(false);
    // final selectThree = useState(false);
    // final selectAll = useState(false);
    String img =
        'https://images.pexels.com/photos/9869646/pexels-photo-9869646.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
    return KnoCardScaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        automaticallyImplyLeading: false,
        title: Text(
          'Community',
          style: GoogleFonts.lato(
            color: Theme.of(context).shadowColor.withOpacity(.6),
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        actions: [
          searchTap.value
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  width: 241.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).shadowColor.withOpacity(.5),
                    ),
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 208.w,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Serarch Networks',
                            hintStyle: GoogleFonts.lato(
                              color: KColor.primaryColor,
                              //fontSize: 12.sp,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          filterTap.value = !filterTap.value;
                          if (ratingsTap.value) {
                            ratingsTap.value = false;
                          }
                          if (radiusTap.value) {
                            radiusTap.value = false;
                          }
                          if (sortTap.value) {
                            sortTap.value = false;
                          }
                        },
                        child: const ImageIcon(
                          AssetImage('assets/icons/filter.png'),
                          color: Color(0xff088ac6),
                        ),
                      ),
                    ],
                  ),
                )
              : IconButton(
                  onPressed: () {
                    searchTap.value = true;
                  },
                  icon: const ImageIcon(
                    AssetImage('assets/icons/search.png'),
                    color: Color(0xff088ac6),
                  ),
                ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                filterTap.value = false;
                radiusTap.value = false;
                ratingsTap.value = false;
                sortTap.value = false;
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 10.w, right: 10.w, bottom: 5.h),
                            padding: EdgeInsets.only(
                                right: 5.w, top: 5.h, bottom: 5.h, left: 10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.sp),
                                color: KColor.backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 2),
                                    color:
                                        KColor.popUpCardColor.withOpacity(.5),
                                    // Theme.of(context).shadowColor.withOpacity(.2),
                                    spreadRadius: 1.sp,
                                  )
                                ]),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: KColor.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(img),
                                      ),
                                    ),
                                    Text(
                                      'View KnocCard',
                                      style: GoogleFonts.lato(
                                        fontSize: 8.sp,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Methhew Jordan',
                                          style: GoogleFonts.lato(
                                            fontSize: 14.sp,
                                            color: KColor.primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Stack(
                                          children: [
                                            ImageIcon(
                                              const AssetImage(
                                                  'assets/icons/srar_fill.png'),
                                              size: 20.sp,
                                              color: KColor.primaryColor,
                                            ),
                                            Positioned(
                                              left: 7.w,
                                              top: 6.h,
                                              child: Text(
                                                '5',
                                                style: TextStyle(
                                                  color: KColor.backgroundColor,
                                                  fontSize: 9.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Ohio || Engineer || 2 years',
                                      style: GoogleFonts.lato(
                                        fontSize: 12.sp,
                                        color: KColor.secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  '1 mi away',
                                  style: GoogleFonts.lato(
                                    color: KColor.secondaryColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                ImageIcon(
                                  const AssetImage(
                                    'assets/icons/arrow_down.png',
                                  ),
                                  color: KColor.primaryColor,
                                  size: 18.sp,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            if (filterTap.value)
              Positioned(
                right: 5.w,
                child: Container(
                  width: 300.w,
                  //height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.sp),
                    color: KColor.backgroundColor,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          radiusTap.value = true;
                          filterTap.value = false;
                        },
                        leading: const SizedBox(),
                        title: Row(
                          children: [
                            ImageIcon(
                              const AssetImage(
                                'assets/icons/radius.png',
                              ),
                              color: KColor.primaryColor,
                              size: 18.sp,
                            ),
                            Text(
                              ' Radius',
                              style: GoogleFonts.lato(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        trailing: ImageIcon(
                          const AssetImage(
                            'assets/icons/arrow_down.png',
                          ),
                          color: KColor.primaryColor,
                          size: 18.sp,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          ratingsTap.value = true;
                          filterTap.value = false;
                        },
                        leading: const SizedBox(),
                        title: Row(
                          children: [
                            ImageIcon(
                              const AssetImage(
                                'assets/icons/5_Star.png',
                              ),
                              color: KColor.primaryColor,
                              size: 18.sp,
                            ),
                            Text(
                              ' Ratings',
                              style: GoogleFonts.lato(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        trailing: ImageIcon(
                          const AssetImage(
                            'assets/icons/arrow_down.png',
                          ),
                          color: KColor.primaryColor,
                          size: 18.sp,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          sortTap.value = true;
                          filterTap.value = false;
                        },
                        leading: const SizedBox(),
                        title: Row(
                          children: [
                            ImageIcon(
                              const AssetImage(
                                'assets/icons/sort.png',
                              ),
                              color: KColor.primaryColor,
                              size: 18.sp,
                            ),
                            Text(
                              ' Sort',
                              style: GoogleFonts.lato(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        trailing: ImageIcon(
                          const AssetImage(
                            'assets/icons/arrow_down.png',
                          ),
                          color: KColor.primaryColor,
                          size: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (sortTap.value)
              Positioned(
                right: 5.w,
                child: Container(
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.sp),
                    color: KColor.backgroundColor,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          sortTap.value = false;
                          filterTap.value = true;
                        },
                        leading: const SizedBox(),
                        title: Row(
                          children: [
                            ImageIcon(
                              const AssetImage(
                                'assets/icons/sort.png',
                              ),
                              color: KColor.primaryColor,
                              size: 18.sp,
                            ),
                            Text(
                              ' Sort',
                              style: GoogleFonts.lato(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        trailing: ImageIcon(
                          const AssetImage(
                            'assets/icons/arrow_down.png',
                          ),
                          color: KColor.primaryColor,
                          size: 18.sp,
                        ),
                      ),
                      Container(
                        width: 300.w,
                        height: 35.h,
                        color: KColor.popUpCardColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Name',
                              style: GoogleFonts.lato(
                                //fontSize: 14.sp,
                                color: KColor.primaryColor,
                              ),
                            ),
                            Text(
                              'Occupation',
                              style: GoogleFonts.lato(
                                //fontSize: 14.sp,
                                color: KColor.primaryColor,
                              ),
                            ),
                            Text(
                              'Location',
                              style: GoogleFonts.lato(
                                //fontSize: 14.sp,
                                color: KColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (ratingsTap.value)
              Positioned(
                right: 5.w,
                child: Container(
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.sp),
                    color: KColor.backgroundColor,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          ratingsTap.value = false;
                          filterTap.value = true;
                        },
                        leading: const SizedBox(),
                        title: Row(
                          children: [
                            ImageIcon(
                              const AssetImage(
                                'assets/icons/5_Star.png',
                              ),
                              color: KColor.primaryColor,
                              size: 18.sp,
                            ),
                            Text(
                              ' Ratings',
                              style: GoogleFonts.lato(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        trailing: ImageIcon(
                          const AssetImage(
                            'assets/icons/arrow_down.png',
                          ),
                          color: KColor.primaryColor,
                          size: 18.sp,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 35.h,
                        width: 300.w,
                        color: KColor.popUpCardColor,
                        child: RatingBar.builder(
                          initialRating: 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          //  allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16.sp,
                          //unratedColor: KColor.primaryColor,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                          itemBuilder: (context, _) => const ImageIcon(
                            AssetImage(
                              'assets/icons/5_Star.png',
                            ),
                            color: KColor.primaryColor,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            if (radiusTap.value)
              Positioned(
                right: 5.w,
                child: Container(
                  width: 300.w,
                  //height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.sp),
                    color: KColor.backgroundColor,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          radiusTap.value = false;
                          filterTap.value = true;
                        },
                        leading: const SizedBox(),
                        title: Row(
                          children: [
                            ImageIcon(
                              const AssetImage(
                                'assets/icons/radius.png',
                              ),
                              color: KColor.primaryColor,
                              size: 18.sp,
                            ),
                            Text(
                              ' Radius',
                              style: GoogleFonts.lato(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        trailing: ImageIcon(
                          const AssetImage(
                            'assets/icons/arrow_down.png',
                          ),
                          color: KColor.primaryColor,
                          size: 18.sp,
                        ),
                      ),
                      Container(
                        width: 300.w,
                        height: 35.h,
                        color: KColor.popUpCardColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                select.value = 1;
                              },
                              child: Row(
                                children: [
                                  select.value == 1
                                      ? ImageIcon(
                                          const AssetImage(
                                            'assets/icons/select.png',
                                          ),
                                          color: KColor.primaryColor,
                                          size: 18.sp,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          size: 18.sp,
                                        ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  const Text('1 Mile'),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                select.value = 2;
                              },
                              child: Row(
                                children: [
                                  select.value == 2
                                      ? ImageIcon(
                                          const AssetImage(
                                            'assets/icons/select.png',
                                          ),
                                          color: KColor.primaryColor,
                                          size: 18.sp,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          size: 18.sp,
                                        ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  const Text('10 Mile'),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                select.value = 3;
                              },
                              child: Row(
                                children: [
                                  select.value == 3
                                      ? ImageIcon(
                                          const AssetImage(
                                            'assets/icons/select.png',
                                          ),
                                          color: KColor.primaryColor,
                                          size: 18.sp,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          size: 18.sp,
                                        ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  const Text('25 Mile'),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                select.value = 4;
                              },
                              child: Row(
                                children: [
                                  select.value == 4
                                      ? ImageIcon(
                                          const AssetImage(
                                            'assets/icons/select.png',
                                          ),
                                          color: KColor.primaryColor,
                                          size: 18.sp,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          size: 18.sp,
                                        ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  const Text('Any'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
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
