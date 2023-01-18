import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/style/color.dart';
import 'package:knocard_ui/utils/const.dart';
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
              color: Colors.grey.shade300,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/knocard.png',
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "KnoCard",
                          style: TextStyle(fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3, bottom: 5),
                          child: const Text("Your all in one business platform",
                              style: TextStyle(color: Colors.black54)),
                        ),
                        Image.asset("assets/images/rating.png", height: 15),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        openApplicationStore();
                      },
                      child: Text(
                        'OPEN',
                        style: TextStyle(
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            ),
            Container(

              color: Colors.white,
              padding: const EdgeInsets.all( 10),
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
                      child: Image.asset('assets/images/knocard_logo.png',height: 60,)),
                 Spacer(),
                 if(state.user_connections.isNotEmpty)
                   Expanded(child: Column(mainAxisSize: MainAxisSize.min,
                     crossAxisAlignment: CrossAxisAlignment.end,children: [
                     Text("Referred by", style: TextStyle(fontSize: 8),),
                     Container(
                         height: 40,
                         width: 40,
                         margin: EdgeInsets.all(3),
                         clipBehavior: Clip.hardEdge,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(width: 2, color: Colors.yellow),
                             image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: state.user_connections[0].refferedUser.profile_picture.isEmpty
                                     ? const AssetImage(
                                     'assets/images/placeholder_profile.png')
                                     : NetworkImage(state.user_connections[0].refferedUser.profile_picture)
                                 as ImageProvider))),
                     Text(state.user_connections[0].refferedUser.name, style: TextStyle(fontSize: 10,color: Colors.black54),),
                   ],))
                  /* ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
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
                      ))*/
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
        /*if (state.company.business_page_title.isNotEmpty)
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
          ),*/
        if (state.profile_picture.isNotEmpty && state.show_profile_picture != 0)
          /*state.getBackGround().categCode != Constants.uploadBackground
              ? Container(
              height: 135,
              width: 135,
              margin: const EdgeInsets.only(bottom: 60),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.white),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: state.profile_picture.isEmpty
                          ? const AssetImage(
                          'assets/images/placeholder_profile.png')
                          : NetworkImage(state.profile_picture)
                      as ImageProvider)))
              :*/ Positioned(
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
                            fit: BoxFit.cover,
                            image: state.profile_picture.isEmpty ||
                                    state.show_profile_picture == 0
                                ? const AssetImage(
                                    'assets/images/placeholder_profile.png')
                                : CachedNetworkImageProvider(
                                    state.profile_picture) as ImageProvider)),
                  )),


        Positioned(
            top: 140.h,
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

  void openApplicationStore() {
    try {

      var url = Const.APP_STORE_URL;

      if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.fuchsia || defaultTargetPlatform == TargetPlatform.linux ||
          defaultTargetPlatform == TargetPlatform.windows) {
        url = Const.PLAY_STORE_URL;
      }

      launchUrlString(url);
    }catch(e){
    }
  }
}
