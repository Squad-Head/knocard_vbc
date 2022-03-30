import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/presentation/knocard_scaffold/knocard_scaffold.dart';
import 'package:knocard_ui/style/color.dart';

class CommuniyPage extends HookConsumerWidget {
  const CommuniyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final searchTap = useState(false);
    String img =
        'https://images.pexels.com/photos/9869646/pexels-photo-9869646.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
    return KnoCardScaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        automaticallyImplyLeading: false,
        title: Text(
          'Community',
          style: TextStyle(
            color: Theme.of(context).shadowColor.withOpacity(.6),
            fontWeight: FontWeight.normal,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          searchTap.value
              ? Expanded(
                  child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).shadowColor.withOpacity(.5),
                    ),
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ))
              : IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(
                    AssetImage('assets/icons/search.png'),
                    color: Color(0xff088ac6),
                  ),
                )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5.h),
                      padding: EdgeInsets.only(
                          right: 5.w, top: 5.h, bottom: 5.h, left: 10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.sp),
                          color: KColor.backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 2),
                              color: KColor.popUpCardColor.withOpacity(.5),
                              // Theme.of(context).shadowColor.withOpacity(.2),
                              spreadRadius: 1.sp,
                            )
                          ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: KColor.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(img),
                                ),
                              ),
                              Text(
                                'View KnocCard',
                                style: GoogleFonts.lato(
                                  fontSize: 8.sp,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Methhew Jordan',
                                    style: GoogleFonts.lato(
                                      fontSize: 14.sp,
                                      color: KColor.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Stack(
                                    children: [
                                      ImageIcon(
                                        const AssetImage(
                                            'assets/icons/srar_fill.png'),
                                        size: 20.sp,
                                        color: KColor.primaryColor,
                                      ),
                                      Positioned(
                                        left: 7.w,
                                        top: 6.h,
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            color: KColor.backgroundColor,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                'Ohio || Engineer || 2 years',
                                style: GoogleFonts.lato(
                                  fontSize: 12.sp,
                                  color: KColor.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '1 mi away',
                            style: GoogleFonts.lato(
                              color: KColor.secondaryColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          ImageIcon(
                            const AssetImage(
                              'assets/icons/arrow_down.png',
                            ),
                            color: KColor.primaryColor,
                            size: 18.sp,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
