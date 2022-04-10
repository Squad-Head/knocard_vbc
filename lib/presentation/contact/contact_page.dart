import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/presentation/contact/widgets/share_history_card.dart';
import 'package:knocard_ui/presentation/knocard_scaffold/knocard_scaffold.dart';
import 'package:knocard_ui/presentation/knocard_scaffold/widget/knocard_bottom_nav.dart';
import 'package:knocard_ui/style/color.dart';

class ContactPage extends HookConsumerWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final List<String> words = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
    String img =
        'https://images.pexels.com/photos/9869646/pexels-photo-9869646.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
    final searchTap = useState(false);
    final expendedLeading = useState(false);
    return KnoCardScaffold(
      hasBackground: true,
      bottomNavigation: KnoCardBottomNav.contact(context),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        automaticallyImplyLeading: false,
        title: Text(
          'Contact',
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
                  width: 260.w,
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
                        width: 228.w,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Serarch contact details',
                            hintStyle: GoogleFonts.lato(
                              color: KColor.primaryColor,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // filterTap.value = !filterTap.value;
                          searchTap.value = false;
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
      body: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(7.sp),
              elevation: 10,
              child: Container(
                width: double.infinity,
                // height: 100.h,
                decoration: BoxDecoration(
                  color: KColor.popUpCardColor,
                  borderRadius: BorderRadius.circular(7.sp),
                  border: Border.all(
                    color: Theme.of(context).shadowColor.withOpacity(.2),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Recently Contacted',
                      style: GoogleFonts.lato(
                        color: KColor.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(img),
                            ),
                            Text(
                              'Jennifer jon',
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '14/02/2022',
                              style: GoogleFonts.lato(
                                fontSize: 12.sp,
                                color: KColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(img),
                            ),
                            Text(
                              'Jennifer jon',
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '14/02/2022',
                              style: GoogleFonts.lato(
                                fontSize: 12.sp,
                                color: KColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(img),
                            ),
                            Text(
                              'Jennifer jon',
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '14/02/2022',
                              style: GoogleFonts.lato(
                                fontSize: 12.sp,
                                color: KColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.sp),
                  color: KColor.popUpCardColor,
                  border: Border.all(
                    color: Theme.of(context).shadowColor.withOpacity(.2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.sp),
                                    height: 80.h,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        expendedLeading.value
                                            ? Material(
                                                shadowColor: Colors.white,
                                                color: KColor.popUpCardColor,
                                                borderOnForeground: false,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.sp),
                                                elevation: 20,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h,
                                                      horizontal: 5.w),
                                                  // height: 50.h,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Theme.of(context)
                                                          .shadowColor
                                                          .withOpacity(.2),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.sp),
                                                  ),
                                                  width: 230.w,
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          expendedLeading
                                                                  .value =
                                                              !expendedLeading
                                                                  .value;
                                                        },
                                                        child: Container(
                                                          width: 50.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: KColor
                                                                  .primaryColor,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.sp),
                                                          ),
                                                          child: CircleAvatar(
                                                            radius: 25.sp,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    img),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return const ShareHistoryCard();
                                                              });
                                                        },
                                                        child: Material(
                                                          type:
                                                              MaterialType.card,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.sp),
                                                          child: Container(
                                                            height: 50.w,
                                                            width: 50.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: KColor
                                                                  .backgroundColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.sp),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                ImageIcon(
                                                                  const AssetImage(
                                                                      'assets/icons/share.png'),
                                                                  size: 24.sp,
                                                                  color: KColor
                                                                      .primaryColor,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Container(
                                                        height: 50.w,
                                                        width: 50.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: KColor
                                                              .backgroundColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.sp),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ImageIcon(
                                                              const AssetImage(
                                                                  'assets/icons/message_outline.png'),
                                                              size: 24.sp,
                                                              color: KColor
                                                                  .primaryColor,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Container(
                                                        height: 50.w,
                                                        width: 50.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: KColor
                                                              .backgroundColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.sp),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ImageIcon(
                                                              const AssetImage(
                                                                  'assets/icons/phone.png'),
                                                              size: 24.sp,
                                                              color: KColor
                                                                  .primaryColor,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  expendedLeading.value =
                                                      !expendedLeading.value;
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 5.h),
                                                  // height: 48.h,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: KColor.primaryColor
                                                          .withOpacity(1),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: CircleAvatar(
                                                    radius: 25.sp,
                                                    backgroundImage:
                                                        NetworkImage(img),
                                                  ),
                                                ),
                                              ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Andrew Neals ',
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                InkWell(
                                                  child: ImageIcon(
                                                    const AssetImage(
                                                        'assets/icons/srar_fill.png'),
                                                    size: 18.sp,
                                                    color: KColor.primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Text(
                                                'View KnoCard',
                                                style: GoogleFonts.lato(
                                                  color: KColor.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    indent: 70.w,
                                    endIndent: 30.w,
                                    height: 2.h,
                                    thickness: 2.h,
                                  ),
                                ],
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                            child: Text(
                              'B',
                              style: GoogleFonts.lato(
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.sp),
                                    height: 80.h,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        expendedLeading.value
                                            ? Material(
                                                shadowColor: Colors.white,
                                                color: KColor.popUpCardColor,
                                                borderOnForeground: false,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.sp),
                                                elevation: 40,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h,
                                                      horizontal: 5.w),
                                                  // height: 50.h,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Theme.of(context)
                                                          .shadowColor
                                                          .withOpacity(.2),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.sp),
                                                  ),
                                                  width: 230.w,
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          expendedLeading
                                                                  .value =
                                                              !expendedLeading
                                                                  .value;
                                                        },
                                                        child: Container(
                                                          width: 50.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: KColor
                                                                  .primaryColor,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.sp),
                                                          ),
                                                          child: CircleAvatar(
                                                            radius: 25.sp,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    img),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return const ShareHistoryCard();
                                                              });
                                                        },
                                                        child: Container(
                                                          height: 50.w,
                                                          width: 50.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: KColor
                                                                .backgroundColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.sp),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ImageIcon(
                                                                const AssetImage(
                                                                    'assets/icons/share.png'),
                                                                size: 24.sp,
                                                                color: KColor
                                                                    .primaryColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Container(
                                                        height: 50.w,
                                                        width: 50.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: KColor
                                                              .backgroundColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.sp),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ImageIcon(
                                                              const AssetImage(
                                                                  'assets/icons/message_outline.png'),
                                                              size: 24.sp,
                                                              color: KColor
                                                                  .primaryColor,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Container(
                                                        height: 50.w,
                                                        width: 50.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: KColor
                                                              .backgroundColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.sp),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ImageIcon(
                                                              const AssetImage(
                                                                  'assets/icons/phone.png'),
                                                              size: 24.sp,
                                                              color: KColor
                                                                  .primaryColor,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  expendedLeading.value =
                                                      !expendedLeading.value;
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 5.h),
                                                  // height: 48.h,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: KColor.primaryColor
                                                          .withOpacity(1),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: CircleAvatar(
                                                    radius: 25.sp,
                                                    backgroundImage:
                                                        NetworkImage(img),
                                                  ),
                                                ),
                                              ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Andrew Neals ',
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                InkWell(
                                                  child: ImageIcon(
                                                    const AssetImage(
                                                        'assets/icons/srar_fill.png'),
                                                    size: 18.sp,
                                                    color: KColor.primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Text(
                                                'View KnoCard',
                                                style: GoogleFonts.lato(
                                                  color: KColor.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    indent: 70.w,
                                    endIndent: 30.w,
                                    height: 2.h,
                                    thickness: 2.h,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      width: 20.w,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            words.length,
                            (index) => SizedBox(
                                  height: 30.h,
                                  child: Text(
                                    words[index],
                                    style: GoogleFonts.lato(
                                      color: Theme.of(context)
                                          .shadowColor
                                          .withOpacity(.6),
                                    ),
                                  ),
                                )),
                      ),
                      // child: ListView.builder(
                      //     itemCount: words.length,
                      //     itemBuilder: (context, index) {
                      //       return SizedBox(
                      //         height: 30.h,
                      //         child: Text(
                      //           words[index],
                      //           style: GoogleFonts.lato(
                      //             color: Theme.of(context)
                      //                 .shadowColor
                      //                 .withOpacity(.6),
                      //           ),
                      //         ),
                      //       );
                      //     }),
                    ),
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
