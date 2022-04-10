import 'package:flutter/material.dart';
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
          Row(
            children: [
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
      ),
    );
  }
}
