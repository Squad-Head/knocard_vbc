import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knocard_ui/presentation/contact/widgtes/mobile_gallery.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/k_home_contact.dart';
import '../widgets/k_home_menu_item.dart';
import '../widgets/k_rates_item.dart';
import '../widgets/k_review_articles.dart';
import '../widgets/k_video_item.dart';

class MobileContactPage extends StatelessWidget {
  final VoidCallback moveToGallery;
  final VoidCallback moveToVideo;
  const MobileContactPage(
      {Key? key, required this.moveToGallery, required this.moveToVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        final Uri telLaunchUri = Uri(
                          scheme: 'tel',
                          path: '9788355889',
                        );

                        launchUrl(telLaunchUri);
                      },
                      child: const KHomeContact(
                        icon: Icon(FontAwesomeIcons.mobileScreen),
                        text: '9788355889',
                      ),
                    ),
                    SizedBox(height: 1.h),
                    InkWell(
                      onTap: () {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'bflemming@gmail.com',
                        );
                        launchUrl(emailLaunchUri);
                      },
                      child: const KHomeContact(
                        icon: Icon(Icons.email),
                        text: 'bflemming@gmail.com',
                      ),
                    ),
                    SizedBox(height: 1.h),
                    InkWell(
                      onTap: () {
                        launchUrl(
                            Uri.parse("https://goo.gl/maps/t4nwMCxLNN3kjs1C6"));
                      },
                      child: const KHomeContact(
                        icon: Icon(LineIcons.globe),
                        text: 'Tampa, Fl, 33635',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextButton(
                      onPressed: moveToGallery,
                      child: Text(
                        'Gallery',
                        style: TextStyle(
                          color: const Color(0xFF088AC6),
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .4,
                      width: MediaQuery.of(context).size.width * .36,
                      child: const MobileGallery(),
                      //color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(width: 40.w),
                Column(
                  children: [
                    TextButton(
                      onPressed: moveToVideo,
                      child: Text(
                        'Videos',
                        style: TextStyle(
                          color: const Color(0xFF088AC6),
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      height: MediaQuery.of(context).size.width * .4,
                      // width: MediaQuery.of(context).size.width * .36,
                      padding: const EdgeInsets.only(left: 3, top: 7),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const KVideoItem(
                            number: '1',
                          ),
                          SizedBox(height: 5.h),
                          const KVideoItem(
                            number: '2',
                          ),
                          SizedBox(height: 5.h),
                          const KVideoItem(
                            number: '3',
                          ),
                          SizedBox(height: 5.h),
                          const KVideoItem(
                            number: '4',
                          ),
                          SizedBox(height: 5.h),
                          const KVideoItem(
                            number: '5',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Services/Contractor/Menu',
              style: TextStyle(
                color: const Color(0xFF088AC6),
                fontSize: 50.sp,
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
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const KReviewArticles(
              image: 'assets/images/rating-1.png',
              text1: 'Alex Duta',
              text2:
                  'To be honest, I was hesitant with joining with 33 Mile Radius... With so many lead gen \ncompanies that offer you everything and end up not fulfilling, 33 Mile Radius sounded too good \nto be true. However my opinion completely changed once I ...',
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
            SizedBox(height: 20.h),
            Text(
              'Rates',
              style: TextStyle(
                color: const Color(0xFF088AC6),
                fontSize: 50.sp,
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
    );
  }
}
