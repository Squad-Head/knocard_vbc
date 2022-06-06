import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgtes/services_menu_item.dart';
import 'widgtes/w_home_contact.dart';
import 'widgtes/w_rates_item.dart';
import 'widgtes/w_review.dart';
import 'widgtes/web_gallery.dart';
import 'widgtes/web_video_item.dart';

class DesktopContactPage extends StatelessWidget {
  final topHeight = 200.0;

  const DesktopContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WHomeContact(
                      icon: FontAwesomeIcons.mobileScreen,
                      text: '9788355889',
                    ),
                    SizedBox(height: 5.w),
                    const WHomeContact(
                      icon: Icons.email,
                      text: 'bflemming@gmail.com',
                    ),
                    SizedBox(height: 5.w),
                    const WHomeContact(
                      icon: FontAwesomeIcons.globe,
                      text: 'Tampa, Fl, 33635',
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Column(
                  children: [
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: const Color(0xFF088AC6),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: height * 0.19,
                      width: width * 0.1,
                      child: const WebGallery(),
                      //color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Column(
                  children: [
                    Text(
                      'Videos',
                      style: TextStyle(
                        color: const Color(0xFF088AC6),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const WebVideoItem(),
                          SizedBox(height: 3.h),
                          const WebVideoItem(),
                          SizedBox(height: 3.h),
                          const WebVideoItem(),
                          SizedBox(height: 3.h),
                          const WebVideoItem(),
                          SizedBox(height: 3.h),
                          const WebVideoItem(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 2.w,
            //color: Colors.blue,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff1d92c8),
                  Color(0x002d8bc8),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                //end: Alignment.bottomCenter,
              ),
            ),
          ),
          Expanded(
            child: Container(
              // width: 450.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              // color: Colors.orange,

              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    child: Text(
                      'Services/Contractor/Menu ',
                      style: TextStyle(
                        color: const Color(0xFF088AC6),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          ServicesMenuItem(
                            icon: FontAwesomeIcons.house,
                            text: 'Additions & Remodels',
                          ),
                          ServicesMenuItem(
                            icon: FontAwesomeIcons.toilet,
                            text: 'Bathrooms',
                          ),
                          ServicesMenuItem(
                            icon: FontAwesomeIcons.paintRoller,
                            text: 'Carpet',
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          ServicesMenuItem(
                            icon: FontAwesomeIcons.houseChimney,
                            text: 'Appliances',
                          ),
                          ServicesMenuItem(
                            icon: FontAwesomeIcons.message,
                            text: 'Cabinets & Countertops',
                          ),
                          ServicesMenuItem(
                            icon: FontAwesomeIcons.globe,
                            text: 'Cleaning & Maid Service',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Rates',
                    style: TextStyle(
                      color: const Color(0xFF088AC6),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.all(15.w),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: WRatesItem(
                            containerColor: Color(0xFF01B497),
                            headTextColor: Color(0xFFD7FAFA),
                            iconColor1: Color(0xFF408A11),
                            iconColor2: Color(0xFFFD4449),
                            iconColor3: Color(0xFFFD4449),
                            iconColor4: Color(0xFFFD4449),
                            buttomTextColor: Color(0xFF01B497),
                            icon1: FontAwesomeIcons.check,
                            icon2: FontAwesomeIcons.close,
                            icon3: FontAwesomeIcons.close,
                            icon4: FontAwesomeIcons.close,
                            headText: 'Basic',
                            buttomText: '\$2.99',
                          ),
                        ),
                        Expanded(
                          child: WRatesItem(
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
                            icon4: FontAwesomeIcons.close,
                            headText: 'Standard',
                            buttomText: '\$5.99',
                          ),
                        ),
                        Expanded(
                          child: WRatesItem(
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.38,
              padding: const EdgeInsets.only(left: 20),
              //color: Colors.red,
              child: Column(
                children: [
                  const Text(
                    'Reviews',
                    style: TextStyle(
                      color: Color(0xFF088AC6),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const WReview(
                    image: 'assets/images/rating-1.png',
                    text1: 'Alex Duta',
                    text2:
                        'To be honest, I was hesitant with joining with 33 Mile Radius... With so many lead gen companies that offer you everything and end up not fulfilling, 33 Mile Radius sounded too good to be true. However my opinion completely changed once I ...',
                    text3: 'More',
                    text4:
                        '\nAlex, you are a great partner. Thanks for the review',
                  ),
                  SizedBox(height: 10.h),
                  const WReview(
                    image: 'assets/images/rating-2.png',
                    text1: 'KC Seats',
                    text2:
                        'These guys have helped my business tremendously. They constantly request feedback in an effort to provide better service. Would recommened these guys any day of the week if you\'re looking to increase your leads.',
                    text3: 'More',
                    text4:
                        '\nThank you for the kind words, we are always trying to help our clients out! Thank you for the kind words, we are always trying to help our clients out!',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
