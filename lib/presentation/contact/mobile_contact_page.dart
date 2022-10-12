import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/profile_video.dart';
import 'package:knocard_ui/presentation/contact/widgtes/mobile_gallery_widget.dart';
import 'package:knocard_ui/presentation/contact/widgtes/show_knocard_dialog_mobile.dart';
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
    final videosCollection = List<List<ProfileVideo>>.from(
        state.playlists.map((e) => e.videos.reversed.toList()));
    final videos = videosCollection.expand((i) => i).toList().reversed.toList();
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
                        if ((state.phone_number.isNotEmpty &&
                                state.showPhoneNumber == 1) ||
                            state.company.business_phone.isNotEmpty)
                          KHomeContact(
                            icon: FontAwesomeIcons.mobile,
                            text: state.phone_country_code +
                                (state.phone_number.isNotEmpty &&
                                        state.showPhoneNumber == 1
                                    ? state.phone_number
                                    : state.company.business_phone),
                            onTap: () {
                              final number = state.phone_country_code +
                                  (state.phone_number.isNotEmpty &&
                                          state.showPhoneNumber == 1
                                      ? state.phone_number
                                      : state.company.business_phone);
                              final Uri telLaunchUri = Uri(
                                scheme: 'tel',
                                path: number,
                              );

                              launchUrl(telLaunchUri);
                            },
                          ),
                        SizedBox(height: 1.h),
                        KHomeContact(
                          onTap: () {
                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: state.email,
                            );
                            launchUrl(emailLaunchUri);
                          },
                          icon: Icons.email,
                          text: state.email,
                        ),
                        SizedBox(height: 1.h),
                        KHomeContact(
                          onTap: () {
                            if (state.latitude != 0 && state.longitude != 0) {
                              launchUrl(Uri.parse(
                                  "https://www.google.com/maps/@${state.latitude},${state.longitude}"));
                            } else {
                              launchUrl(Uri.parse(
                                  "https://maps.google.com/?q=${state.getUserAddress()}"));
                            }
                          },
                          icon: LineIcons.globe,
                          text: state.getUserAddress(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                if (state.isSelected(7) || state.isSelected(8))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.isSelected(7))
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
                            GestureDetector(
                              onTap: () {
                                AutoTabsRouter.of(context).setActiveIndex(1);
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * .36,
                                child: MobileGalleryWidget(
                                  photos: photos,
                                ),
                                //color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      if (state.isSelected(7)) SizedBox(width: 40.w),
                      if (state.isSelected(8))
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
                            GestureDetector(
                              onTap: () {
                                AutoTabsRouter.of(context).setActiveIndex(2);
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * .5,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      videos.length <= 5 ? videos.length : 5,
                                  itemBuilder: (context, index) => KVideoItem(
                                    index: index,
                                    video: videos[index],
                                  ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 10.h,
                                  ),
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
              builder: (context) => const ShowKnocardDialogMobile());
        },
        child: CircleAvatar(
          radius: 100.sp,
          backgroundColor: Colors.transparent,
          backgroundImage: const AssetImage('assets/icons/share_refer.png'),
        ),
      ),
    );
  }
}
