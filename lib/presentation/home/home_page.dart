import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knocard_ui/presentation/widgets/k_navbar.dart';

import '../widgets/k_home_contact.dart';
import '../widgets/k_home_menu_item.dart';
import '../widgets/k_rates_item.dart';
import '../widgets/k_review_articles.dart';
import '../widgets/k_staggered_gridview.dart';
import '../widgets/k_video_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
=======
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/presentation/home/widgtes/custom_radio.dart';
import 'package:knocard_ui/presentation/home/widgtes/graph_widget.dart';
import 'package:knocard_ui/presentation/knocard_scaffold/widget/knocard_bottom_nav.dart';
import 'package:knocard_ui/presentation/widgets/container_shadow.dart';
import 'package:knocard_ui/resources/asset_icons.dart';
import 'package:knocard_ui/resources/assets.dart';
import 'package:knocard_ui/style/color.dart';

import '../knocard_scaffold/knocard_scaffold.dart';
import 'widgtes/text_with_badge.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final radioCount = useState(0);
    return KnoCardScaffold(
      bottomNavigation: KnoCardBottomNav.home(context),
      appBar: AppBar(
        backgroundColor: KColor.backgroundColor,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: KColor.greyColor,
        ),
        leading: const Icon(FontAwesomeIcons.bars),
        title: Image.asset(
          Assets.knocardLogo,
          width: 120.w,
        ),
        actions: [
          const Icon(
            Icons.notifications,
            color: KColor.greyColor,
          ),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Community Search",
            style: TextStyle(
              fontSize: 18.sp,
              color: KColor.textColor,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(5.r),
            shadowColor: Colors.grey.shade200,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 0),
                hintText: "Search Community Here",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Image.asset(
                    AssetIcons.search,
                    fit: BoxFit.fitHeight,
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomRadio(
                  value: 0,
                  groupValue: 2,
                  onChanged: (_) {
                    radioCount.value = 0;
                  },
                  text: "1 Mile",
                ),
                CustomRadio(
                  value: 1,
                  groupValue: 2,
                  onChanged: (_) {
                    radioCount.value = 1;
                  },
                  text: "5 Mile",
                ),
                CustomRadio(
                  value: 2,
                  groupValue: radioCount.value,
                  onChanged: (_) {
                    radioCount.value = 2;
                  },
                  text: "25 Mile",
                ),
                CustomRadio(
                  value: 3,
                  groupValue: radioCount.value,
                  onChanged: (_) {
                    radioCount.value = 3;
                  },
                  text: "Any",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Data Reporting",
            style: TextStyle(
              fontSize: 18.sp,
              color: KColor.textColor,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ContainerShadow(
            // width: double.infinity,
            margin: EdgeInsets.all(5.w),
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "Activity Counter",
                    style: TextStyle(
                      color: KColor.primaryColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 45.h,
                    // width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: const [
                        TextWithBadge(
                          badgeText: '3',
                          text: "TODAY",
                          isSelected: false,
                        ),
                        TextWithBadge(
                          badgeText: '16',
                          text: "Last 7 Days",
                          isSelected: true,
                        ),
                        TextWithBadge(
                          badgeText: '48',
                          text: "Last 30 Days",
                          isSelected: false,
                        ),
                        TextWithBadge(
                          badgeText: '128',
                          text: "All Time",
                          isSelected: false,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            children: const [
              GraphWidget(),
              GraphWidget(),
              GraphWidget(),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(children: [
            ContainerShadow(
              width: MediaQuery.of(context).size.width / 2 - 40,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/home1.png",
                    height: 60.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Edit KnoCard",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: KColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ]),
          SizedBox(
            height: 25.h,
          ),
          Row(
            children: const [
              GraphWidget(),
              GraphWidget(),
              GraphWidget(),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              ContainerShadow(
                width: MediaQuery.of(context).size.width / 2 - 40,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                margin: EdgeInsets.only(left: 2.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/home1.png",
                      height: 60.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Edit KnoCard",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: KColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              ContainerShadow(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                width: MediaQuery.of(context).size.width / 2 - 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/home2.png",
                      height: 80.h,
                    ),
                    Text(
                      "KnoCard News",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: KColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
>>>>>>> 943dab235b3f6d8df8030af3e28266435b03e7af
      ),
    );
  }
}
