import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/constants.dart';
import 'package:knocard_ui/style/color.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeaderBackground extends ConsumerWidget {
  final int index;
  final VoidCallback goHome;
  const HeaderBackground({Key? key, required this.index, required this.goHome})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(profileProvider).userProfile;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Column(
          children: [
            Container(
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () async {
                        final can = await canLaunchUrlString(
                            'https://www.knocard.com/');
                        if (can) {
                          launchUrlString('https://www.knocard.com/');
                        }
                      },
                      child: Image.asset('assets/images/knocard_logo.png')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        const url =
                            'https://apps.apple.com/us/app/knocard/id1495206208';
                        launchUrlString(url);
                      },
                      child: Row(
                        children: const [
                          Text('Get KnoCard'),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.download_outlined,
                            size: 15,
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
              child: Container(
                  color: Colors.white, child: state.getBackGround().widget),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              padding: const EdgeInsets.only(left: 110, top: 5, bottom: 5),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: KColor.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.first_name + " " + state.last_name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    state.occupation,
                    style: const TextStyle(
                      color: Color(0xFFB9BBBA),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (state.company.business_page_title.isNotEmpty)
          Container(
            // margin: const EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: const Color(0xFF088AC6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.w),
                bottomRight: Radius.circular(15.w),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF5A596B),
                  offset: Offset(-3, 3),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Text(
              state.company.business_page_title,
              // 'Dale\'s home services',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        if (state.profile_picture.isEmpty && state.show_profile_picture != 0)
          state.getBackGround().categCode != Constants.uploadBackground
              ? Center(
                  child: Container(
                      height: 135,
                      width: 135,
                      margin: const EdgeInsets.only(bottom: 60),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white),
                          image: DecorationImage(
                              image: state.profile_picture.isEmpty
                                  ? const AssetImage(
                                      'assets/images/placeholder_profile.png')
                                  : CachedNetworkImageProvider(
                                          state.profile_picture)
                                      as ImageProvider))))
              : Positioned(
                  left: 20,
                  bottom: 80,
                  child: Container(
                    height: 80,
                    width: 80,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                        image: DecorationImage(
                            image: state.profile_picture.isEmpty ||
                                    state.show_profile_picture == 0
                                ? const AssetImage(
                                    'assets/images/placeholder_profile.png')
                                : CachedNetworkImageProvider(
                                    state.profile_picture) as ImageProvider)),
                  )),
        Positioned(
            top: 60.h,
            right: 10.w,
            child: AnimatedOpacity(
              opacity: index == 0 ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: goHome,
                  child: const Text('Go home')),
            )),
      ],
    );
  }
}
