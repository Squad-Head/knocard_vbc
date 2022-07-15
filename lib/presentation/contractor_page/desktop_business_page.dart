// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';

import 'widgets/content_model.dart';

class DesktopBusinessPage extends HookConsumerWidget {
  const DesktopBusinessPage({Key? key}) : super(key: key);
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
                            ],
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
