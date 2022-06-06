import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knocard_ui/style/color.dart';

import 'widgtes/menu_item.dart';
import 'widgtes/services_menu_item.dart';
import 'widgtes/w_home_contact.dart';
import 'widgtes/w_rates_item.dart';
import 'widgtes/w_review.dart';
import 'widgtes/web_gallery.dart';
import 'widgtes/web_video_item.dart';

class DesktopHomePage extends StatelessWidget {
  final topHeight = 200.0;

  const DesktopHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              // Max Size Widget
              SizedBox(
                height: topHeight,
                width: double.infinity,
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff1d92c8),
                        Color(0xffc1ddef),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      //end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              Positioned(
                bottom: 0.0,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xffF6F6FF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      MenuItem(
                        icon: FontAwesomeIcons.mobileScreen,
                        text: 'Contacts',
                      ),
                      SizedBox(width: 12.0),
                      MenuItem(
                        icon: FontAwesomeIcons.images,
                        text: 'Gallery',
                      ),
                      SizedBox(width: 12.0),
                      MenuItem(
                        icon: FontAwesomeIcons.video,
                        text: 'Videos',
                      ),
                      SizedBox(width: 12.0),
                      MenuItem(
                        icon: FontAwesomeIcons.leaf,
                        text: 'Contractor',
                      ),
                      SizedBox(width: 12.0),
                      MenuItem(
                        icon: FontAwesomeIcons.handshake,
                        text: 'Reviews',
                      ),
                      SizedBox(width: 12.0),
                      MenuItem(
                        icon: FontAwesomeIcons.calendarCheck,
                        text: 'Rates',
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: KColor.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFB1B2B7),
                        offset: Offset(0, 4),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 140.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Brett Flemming",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        const Text(
                          "Contractor",
                          style: TextStyle(
                            color: Color(0xFFB9BBBA),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 87,
                left: 50,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)),
                  child: const CircleAvatar(
                    //radius: 45,
                    // child: ClipOval(
                    //   child: Image.network(
                    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWR89EvH9ioXbj_sjTwDAroSfvJVyNaN6tOgTlUQVrgkMBcSjQUAW-RlficXlTSfPQR7Q&usqp=CAU'
                    //   ),
                    // ),
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWR89EvH9ioXbj_sjTwDAroSfvJVyNaN6tOgTlUQVrgkMBcSjQUAW-RlficXlTSfPQR7Q&usqp=CAU'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - topHeight - 50,
            margin: const EdgeInsets.only(top: 15, bottom: 30),
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  padding: EdgeInsets.only(left: 40.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          WHomeContact(
                            icon: FontAwesomeIcons.mobileScreen,
                            text: '9788355889',
                          ),
                          SizedBox(height: 5),
                          WHomeContact(
                            icon: Icons.email,
                            text: 'bflemming@gmail.com',
                          ),
                          SizedBox(height: 5),
                          WHomeContact(
                            icon: FontAwesomeIcons.globe,
                            text: 'Tampa, Fl, 33635',
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Column(
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
                            Container(
                              height: height * 0.19,
                              width: width * 0.1,
                              child: const WebGallery(),
                              //color: Colors.grey,
                            ),
                          ],
                        ),
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
                            // height: height * 0.20,
                            // width: height * 0.17,
                            height: 120.h,
                            width: 105.w,
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
                  width: 2,
                  //color: Colors.blue,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff1d92c8),
                        Color(0x2D8BC8),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      //end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.39,
                  padding: EdgeInsets.only(left: 18.w, right: 20.w),
                  // color: Colors.orange,

                  child: Column(
                    children: [
                      const Text(
                        'Services/Contractor/Menu',
                        style: TextStyle(
                          color: Color(0xFF088AC6),
                          //fontSize: 14.sp,
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
                                const ServicesMenuItem(
                                  icon: Icon(FontAwesomeIcons.house),
                                  text: 'Additions & Remodels',
                                ),
                                SizedBox(height: 5.h),
                                const ServicesMenuItem(
                                  icon: Icon(FontAwesomeIcons.toilet),
                                  text: 'Bathrooms',
                                ),
                                SizedBox(height: 5.h),
                                const ServicesMenuItem(
                                  icon: Icon(FontAwesomeIcons.paintRoller),
                                  text: 'Carpet',
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ServicesMenuItem(
                                  icon: Icon(FontAwesomeIcons.houseChimney),
                                  text: 'Appliances',
                                ),
                                SizedBox(height: 5.h),
                                const ServicesMenuItem(
                                  icon: Icon(FontAwesomeIcons.message),
                                  text: 'Cabinets & Countertops',
                                ),
                                SizedBox(height: 5.h),
                                const ServicesMenuItem(
                                  icon: Icon(FontAwesomeIcons.globe),
                                  text: 'Cleaning & Maid Service',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Rates',
                        style: TextStyle(
                          color: const Color(0xFF088AC6),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            WRatesItem(
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
                            WRatesItem(
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
                            WRatesItem(
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
