import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgtes/services_menu_item.dart';
import 'widgtes/show_knocard_dialog_desktop.dart';
import 'widgtes/w_home_contact.dart';
import 'widgtes/w_rates_item.dart';
import 'widgtes/w_review.dart';
import 'widgtes/web_gallery.dart';
import 'widgtes/web_video_item.dart';

class DesktopContactPage extends HookConsumerWidget {
  final VoidCallback moveToGallery;
  final VoidCallback moveToVideo;
  final topHeight = 200.0;

  const DesktopContactPage(
      {Key? key, required this.moveToGallery, required this.moveToVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final state = ref.watch(profileProvider).userProfile;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.h),
          width: double.infinity,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40.w),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              final Uri telLaunchUri = Uri(
                                scheme: 'tel',
                                path: state.mobile_number,
                              );

                              launchUrl(telLaunchUri);
                            },
                            child: WHomeContact(
                              icon: FontAwesomeIcons.mobileScreen,
                              text: state.mobile_number.isNotEmpty
                                  ? state.mobile_number
                                  : state.phone_number,
                            ),
                          ),
                          SizedBox(height: 5.w),
                          InkWell(
                            onTap: () {
                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: state.email,
                              );
                              launchUrl(emailLaunchUri);
                            },
                            child: WHomeContact(
                              icon: Icons.email,
                              text: state.email,
                            ),
                          ),
                          SizedBox(height: 5.w),
                          InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  "https://goo.gl/maps/t4nwMCxLNN3kjs1C6"));
                            },
                            child: WHomeContact(
                              icon: FontAwesomeIcons.globe,
                              text: state.city +
                                  ', ' +
                                  state.state +
                                  ', ' +
                                  state.zip_code.toString(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      Column(
                        children: [
                          TextButton(
                            onPressed: moveToGallery,
                            child: (Text(
                              'Gallery',
                              style: TextStyle(
                                color: const Color(0xFF088AC6),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
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
                          TextButton(
                            onPressed: moveToVideo,
                            child: Text(
                              'Videos',
                              style: TextStyle(
                                color: const Color(0xFF088AC6),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: height * 0.19,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.playlists[0].videos.length <= 4
                                    ? state.playlists[0].videos.length
                                    : 4,
                                itemBuilder: (context, index) => WebVideoItem(
                                  index: index,
                                  video: state.playlists[0].videos[index],
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 10.h,
                                ),
                              ),
                            ),
                            // child: Column(
                            //   children: [
                            //     const WebVideoItem(),
                            //     SizedBox(height: 3.h),
                            //     const WebVideoItem(),
                            //     SizedBox(height: 3.h),
                            //     const WebVideoItem(),
                            //     SizedBox(height: 3.h),
                            //     const WebVideoItem(),
                            //     SizedBox(height: 3.h),
                            //     const WebVideoItem(),
                            //   ],
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                                icon2: FontAwesomeIcons.xmark,
                                icon3: FontAwesomeIcons.xmark,
                                icon4: FontAwesomeIcons.xmark,
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
                                icon4: FontAwesomeIcons.xmark,
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
        ),
        Positioned(
          right: 20.w,
          bottom: 20.h,
          child: InkWell(
            onTap: () {
              // Share.share('http://dev.knocard.com/iamginofernando');
              showDialog(
                  context: context,
                  builder: (context) => const ShowKnocardDialogDesktop());
            },
            child: CircleAvatar(
              radius: 30.sp,
              backgroundColor: Colors.transparent,
              backgroundImage: const AssetImage('icons/SHARE-REFER.png'),
            ),
          ),
        ),
      ],
    );
  }
}
