import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/profile_video.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgtes/show_knocard_dialog_desktop.dart';
import 'widgtes/w_home_contact.dart';
import 'widgtes/web_gallery.dart';
import 'widgtes/web_video_item.dart';

class DesktopContactPage extends HookConsumerWidget {
  const DesktopContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var width = MediaQuery.of(context).size.width;
    final state = ref.watch(profileProvider).userProfile;
    final photos = ref.watch(
        profileProvider.select((value) => value.userProfile.photo_galleries));
    final videosCollection = List<List<ProfileVideo>>.from(
        state.playlists.map((e) => e.videos.reversed.toList()));
    final videos = videosCollection.expand((i) => i).toList().reversed.toList();
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          // Share.share('http://dev.knocard.com/iamginofernando');
          showDialog(
              context: context,
              builder: (context) => const ShowKnocardDialogDesktop());
        },
        child: CircleAvatar(
          radius: 30.sp,
          backgroundColor: Colors.transparent,
          backgroundImage: const AssetImage('assets/icons/share_refer.png'),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15.h),
        width: double.infinity,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 40.w),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if ((state.phone_number.isNotEmpty &&
                        state.showPhoneNumber == 1) ||
                    state.company.business_phone.isNotEmpty)
                  InkWell(
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
                    child: WHomeContact(
                      icon: FontAwesomeIcons.mobileScreen,
                      text: state.phone_country_code +
                          (state.phone_number.isNotEmpty &&
                                  state.showPhoneNumber == 1
                              ? state.phone_number
                              : state.company.business_phone),
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
                    if (state.latitude != 0 && state.longitude != 0) {
                      launchUrl(Uri.parse(
                          "https://www.google.com/maps/@${state.latitude},${state.longitude}"));
                    } else {
                      launchUrl(Uri.parse(
                          "https://maps.google.com/?q=${state.getUserAddress()}"));
                    }
                  },
                  child: WHomeContact(
                    icon: FontAwesomeIcons.globe,
                    text: state.getUserAddress(),
                  ),
                ),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (photos.isNotEmpty)
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              AutoTabsRouter.of(context).setActiveIndex(1);
                            },
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
                            width: width * 0.3,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: WebGallery(
                                photos: photos,
                              ),
                            ),
                            //color: Colors.grey,
                          ),
                        ],
                      ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            // AutoTabsRouter.of(context).
                            AutoTabsRouter.of(context).setActiveIndex(2);
                          },
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
                        SizedBox(
                          width: width * 0.3,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: videos.length > 4 ? 4 : videos.length,
                              itemBuilder: (context, index) => WebVideoItem(
                                index: index,
                                video: videos[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
