import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/presentation/contact/widgtes/mobile_gallery_widget.dart';
import 'package:knocard_ui/presentation/contact/widgtes/show_knocard_dialog_desktop.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/k_home_contact.dart';
import '../widgets/k_video_item.dart';

class MobileContactPage extends HookConsumerWidget {
  const MobileContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(profileProvider).userProfile;
    final photos = ref.watch(
        profileProvider.select((value) => value.userProfile.photo_galleries));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
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
                              path: state.mobile_number,
                            );

                            launchUrl(telLaunchUri);
                          },
                          child: KHomeContact(
                            icon: const Icon(FontAwesomeIcons.mobileScreen),
                            text: state.mobile_number.isNotEmpty
                                ? state.mobile_number
                                : state.phone_number,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        InkWell(
                          onTap: () {
                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: state.email,
                            );
                            launchUrl(emailLaunchUri);
                          },
                          child: KHomeContact(
                            icon: const Icon(Icons.email),
                            text: state.email,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "https://goo.gl/maps/t4nwMCxLNN3kjs1C6"));
                          },
                          child: KHomeContact(
                            icon: const Icon(LineIcons.globe),
                            text: state.city +
                                ', ' +
                                state.state +
                                ', ' +
                                state.zip_code.toString(),
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
                    if (photos.isNotEmpty)
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              AutoTabsRouter.of(context).setActiveIndex(1);
                            },
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
                            child: MobileGalleryWidget(
                              photos: photos,
                            ),
                            //color: Colors.grey,
                          ),
                        ],
                      ),
                    if (photos.isNotEmpty) SizedBox(width: 40.w),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            AutoTabsRouter.of(context).setActiveIndex(2);
                          },
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
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .4,
                          width: MediaQuery.of(context).size.width * .5,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.playlists[0].videos.length <= 5
                                ? state.playlists[0].videos.length
                                : 5,
                            itemBuilder: (context, index) => KVideoItem(
                              index: index,
                              video: state.playlists[0].videos[index],
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          // Share.share('http://dev.knocard.com/iamginofernando');
          showDialog(
              context: context,
              builder: (context) => const ShowKnocardDialogDesktop());
        },
        child: CircleAvatar(
          radius: 100.sp,
          backgroundColor: Colors.transparent,
          backgroundImage: const AssetImage('icons/share_refer.png'),
        ),
      ),
    );
  }
}
