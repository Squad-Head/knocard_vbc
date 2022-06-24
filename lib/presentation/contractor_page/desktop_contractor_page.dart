// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';

import 'widgets/content_model.dart';

class DesktopContractorPage extends HookConsumerWidget {
  const DesktopContractorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    var chipSelected = useState(0);
    final company =
        ref.watch(profileProvider.select((value) => value.userProfile.company));
    return LayoutBuilder(builder: (context, constraint) {
      return Scaffold(
          body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              Text(
                                company.business_page_title,
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
                                child: Image.network(
                                  company.profile_picture,
                                  fit: BoxFit.cover,
                                  // height: 160.h,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                width: MediaQuery.of(context).size.width,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 10.w,
                                  ),
                                  itemBuilder: (context, index) => ChoiceChip(
                                    avatar: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                    ),
                                    label: const Text("LINK"),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                    labelPadding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
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
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: contents.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 30.h,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              final content = contents[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.w),
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
                                      blurRadius: 2.r,
                                      spreadRadius: .5.r,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      // height: 160.h,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          content.title,
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
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
            ),
          ],
        ),
      ));
    });
  }
}
