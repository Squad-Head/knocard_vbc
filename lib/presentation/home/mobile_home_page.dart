import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knocard_ui/presentation/widgets/k_navbar.dart';

import '../widgets/k_home_contact.dart';
import '../widgets/k_home_menu_item.dart';
import '../widgets/k_rates_item.dart';
import '../widgets/k_review_articles.dart';
import '../widgets/k_staggered_gridview.dart';
import '../widgets/k_video_item.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 420.h,
                color: const Color(0xFFF6F6FF),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      height: 300.h,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/cover.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color(0xFF088AC6),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF5A596B),
                            offset: Offset(-3, 3),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: const Text(
                        'Dale\'s home services',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 250),
                      padding: const EdgeInsets.only(left: 110),
                      height: 55.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF088AC6),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFB1B2B7),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brett Flemming',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Contractor',
                            style: TextStyle(
                              color: const Color(0xFFAFADAE),
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 217),
                          child: Container(
                            height: 95.h,
                            width: 95.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: const CircleAvatar(
                              radius: 45,
                              backgroundImage:
                                  AssetImage('assets/images/men_1.jpg'),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 320, left: 10, right: 10),
                      child: KNavbar(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Column(
                  children: [
                    const KHomeContact(
                      icon: Icon(FontAwesomeIcons.mobileScreen),
                      text: '9788355889',
                    ),
                    SizedBox(height: 5.h),
                    const KHomeContact(
                      icon: Icon(FontAwesomeIcons.solidMessage),
                      text: 'bflemming@gmail.com',
                    ),
                    SizedBox(height: 5.h),
                    const KHomeContact(
                      icon: Icon(FontAwesomeIcons.globe),
                      text: 'Tampa, Fl, 33635',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Gallery',
                        style: TextStyle(
                          color: const Color(0xFF088AC6),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      const KStaggeredGridView(),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    children: [
                      Text(
                        'Videos',
                        style: TextStyle(
                          color: const Color(0xFF088AC6),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        padding: const EdgeInsets.only(left: 3, top: 7),
                        height: 130.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const KVideoItem(),
                            SizedBox(height: 3.h),
                            const KVideoItem(),
                            SizedBox(height: 3.h),
                            const KVideoItem(),
                            SizedBox(height: 3.h),
                            const KVideoItem(),
                            SizedBox(height: 3.h),
                            const KVideoItem(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                'Services/Contractor/Menu',
                style: TextStyle(
                  color: const Color(0xFF088AC6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const KHomeMenuItem(
                          icon: Icon(FontAwesomeIcons.house),
                          text: 'Additions & Remodels',
                        ),
                        SizedBox(height: 5.h),
                        const KHomeMenuItem(
                          icon: Icon(FontAwesomeIcons.toilet),
                          text: 'Bathrooms',
                        ),
                        SizedBox(height: 5.h),
                        const KHomeMenuItem(
                          icon: Icon(FontAwesomeIcons.paintRoller),
                          text: 'Carpet',
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const KHomeMenuItem(
                          icon: Icon(FontAwesomeIcons.houseChimney),
                          text: 'Appliances',
                        ),
                        SizedBox(height: 5.h),
                        const KHomeMenuItem(
                          icon: Icon(FontAwesomeIcons.message),
                          text: 'Cabinets & Countertops',
                        ),
                        SizedBox(height: 5.h),
                        const KHomeMenuItem(
                          icon: Icon(FontAwesomeIcons.globe),
                          text: 'Cleaning & Maid Service',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Reviews',
                style: TextStyle(
                  color: const Color(0xFF088AC6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const KReviewArticles(
                image: 'assets/images/rating-1.png',
                text1: 'Alex Duta',
                text2:
                    'To be honest, I was hesitant with joining with 33 Mile Radius... With so many lead gen \ncompanies that offer you everything and end up not fulfilling, 33 Mile Radius sounded too good to be \ntrue. However my opinion completely changed once I ...',
                text3: 'More',
                text4: '\nAlex, you are a great partner. Thanks for the review',
              ),
              SizedBox(height: 10.h),
              const KReviewArticles(
                image: 'assets/images/rating-2.png',
                text1: 'KC Seats',
                text2:
                    'These guys have helped my business tremendously. \nThey constantly request feedback in an effort to provide better service. \nWould recommened these guys any day of the week if you\'re looking to increase your leads.',
                text3: 'More',
                text4:
                    '\nThank you for the kind words, we are always trying to help our clients out!',
              ),
              SizedBox(height: 10.h),
              Text(
                'Rates',
                style: TextStyle(
                  color: const Color(0xFF088AC6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    KRatesItem(
                      containerColor: Color(0xFF01B497),
                      headTextColor: Color(0xFFD7FAFA),
                      iconColor1: Color(0xFF408A11),
                      iconColor2: Color(0xFFFD4449),
                      iconColor3: Color(0xFFFD4449),
                      iconColor4: Color(0xFFFD4449),
                      buttomTextColor: Color(0xFF01B497),
                      icon1: FontAwesomeIcons.check,
                      icon2: FontAwesomeIcons.xmark,
                      icon3: FontAwesomeIcons.xmark,
                      icon4: FontAwesomeIcons.xmark,
                      headText: 'Basic',
                      buttomText: '\$2.99',
                    ),
                    KRatesItem(
                      containerColor: Color(0xFF2C70FF),
                      headTextColor: Color(0xFFEEF8F7),
                      iconColor1: Color(0xFF408A11),
                      iconColor2: Color(0xFF408A11),
                      iconColor3: Color(0xFF408A11),
                      iconColor4: Color(0xFFFD4449),
                      buttomTextColor: Color(0xFF2C70FF),
                      icon1: FontAwesomeIcons.check,
                      icon2: FontAwesomeIcons.check,
                      icon3: FontAwesomeIcons.check,
                      icon4: FontAwesomeIcons.xmark,
                      headText: 'Standard',
                      buttomText: '\$5.99',
                    ),
                    KRatesItem(
                      containerColor: Color(0xFFFF6E1D),
                      headTextColor: Color(0xFFFEF5F5),
                      iconColor1: Color(0xFF408A11),
                      iconColor2: Color(0xFF408A11),
                      iconColor3: Color(0xFF408A11),
                      iconColor4: Color(0xFF408A11),
                      buttomTextColor: Color(0xFFFF6E1D),
                      icon1: FontAwesomeIcons.check,
                      icon2: FontAwesomeIcons.check,
                      icon3: FontAwesomeIcons.check,
                      icon4: FontAwesomeIcons.check,
                      headText: 'Premium',
                      buttomText: '\$8.99',
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
