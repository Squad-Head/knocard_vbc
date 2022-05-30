import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/presentation/home_services/widgets/content_model.dart';
import 'package:knocard_ui/style/color.dart';
import 'package:line_icons/line_icons.dart';

class HomeService extends HookConsumerWidget {
  const HomeService({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weddingImage =
        'https://www.pexels.com/photo/couple-standing-on-grass-field-while-looking-at-each-other-1603884/';
    var chipSelected = useState(0);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          //Circle avatar

          Container(
            height: 190.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff1d92c8),
                  Color(0xffc1ddef),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                    color: KColor.primaryColor,
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black26,
                        offset: Offset(-2, 2),
                        blurRadius: 2,
                        spreadRadius: .5,
                      ),
                    ],
                  ),
                  child: Text(
                    "Dale's home service",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/300',
                    ),
                    radius: 60,
                  ),
                ),
              ],
            ),
          ),

          //Name & designation

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                Text(
                  "Brett Flemming",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "Contractor",
                  style: TextStyle(
                    color: const Color(0xFFB9BBBA),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          //Nav bar section

          Container(
            color: const Color(0xfff6f6ff),
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: SizedBox(
              height: 50.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _navItem(
                    context,
                    "Contacts",
                    FontAwesomeIcons.mobileScreen,
                    onTap: () {},
                  ),
                  _navItem(
                    context,
                    "Gallery",
                    FontAwesomeIcons.image,
                    onTap: () {},
                  ),
                  _navItem(
                    context,
                    "Videos",
                    LineIcons.film,
                    onTap: () {},
                  ),
                  _navItem(
                    context,
                    "Contractor",
                    Icons.phone_android,
                    onTap: () {},
                  ),
                  _navItem(
                    context,
                    "Reviews",
                    Icons.phone_android,
                    onTap: () {},
                  ),
                  _navItem(
                    context,
                    "Rates",
                    Icons.phone_android,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          //main body

          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              child: ListView(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Baxter Photos",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Image.asset(
                      'assets/images/weddingImage.jpg',
                      fit: BoxFit.cover,
                      height: 160.h,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Celebrate your best days!',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Apr 30, 2022',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                      itemBuilder: (context, index) => ChoiceChip(
                        avatar: const CircleAvatar(
                          backgroundColor: Colors.white,
                        ),
                        label: const Text("LINK"),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        labelPadding: EdgeInsets.symmetric(horizontal: 25.w),
                        backgroundColor: const Color(0xff20a0df),
                        selectedColor: const Color(0xff16729f),
                        pressElevation: 5,
                        selected: chipSelected.value == index,
                        onSelected: (value) {
                          chipSelected.value = index;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: contents.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 30.h,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final content = contents[index];
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 15.h),
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(-4, 4),
                              blurRadius: 4,
                              spreadRadius: 1.5,
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(1.5, -1.5),
                              blurRadius: 2,
                              spreadRadius: .5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 160.h,
                              child: content.imgUrl != null
                                  ? Image.asset(
                                      content.imgUrl!,
                                      fit: BoxFit.cover,
                                    )
                                  : content.text != null
                                      ? Text(
                                          content.text!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                            height: 1.3,
                                          ),
                                        )
                                      : const Text('Nothing to show'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  content.title,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  content.date,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              content.caption,
                              style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _navItem(BuildContext context, String text, IconData icon,
      {required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 30.sp,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
