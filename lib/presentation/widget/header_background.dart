import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart' hide MenuItem;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/profile/user_profile.dart';
import 'package:knocard_ui/style/color.dart';

class HeaderBackground extends ConsumerWidget {
  final String coverPhoto;
  final int index;
  final VoidCallback goHome;
  const HeaderBackground(
      {Key? key,
      required this.coverPhoto,
      required this.index,
      required this.goHome})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(profileProvider).userProfile;
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Column(
            children: [
              coverPhoto.isEmpty
                  ? Container(
                      height: 150,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff1d92c8),
                            Color(0xffc1ddef),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          //end: Alignment.bottomCenter,
                        ),
                      ),
                    )
                  : ImageNetwork(
                      // image: coverPhoto,
                      //   imageCache: CachedNetworkImageProvider(coverPhoto),
                      image: state.company.profile_picture,
                      imageCache: CachedNetworkImageProvider(
                          state.company.profile_picture),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      // duration: 1500,
                      curve: Curves.easeIn,
                      // onPointer: true,
                      // debugPrint: false,
                      // fullScreen: false,
                      fitAndroidIos: BoxFit.cover,
                      fitWeb: BoxFitWeb.cover,
                      onLoading: const CircularProgressIndicator(
                        color: Colors.indigoAccent,
                      ),
                      onError: const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      onTap: () {
                        debugPrint("©gabriel_patrick_souza");
                      },
                    ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: KColor.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFB1B2B7),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 140.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.first_name + " " + state.last_name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        state.occupation,
                        style: const TextStyle(
                          color: Color(0xFFB9BBBA),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
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
          Positioned(
              left: 40.w,
              top: 100.h,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white)),
                child: CircleAvatar(
                  child: ImageNetwork(
                    image: ref.watch(profileProvider
                        .select((value) => value.userProfile.profile_picture)),
                    height: 80,
                    width: 80,
                  ),
                ),
              )),
          Positioned(
              top: 10.h,
              right: 10.w,
              child: AnimatedOpacity(
                opacity: index == 0 ? 1 : 1,
                duration: const Duration(milliseconds: 500),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      await CleanApi.instance().get(
                        fromJson: ((json) =>
                            UserProfile.fromMap(json['payload'])),
                        endPoint: 'user/vbc/iamginofernando',
                        showLogs: true,
                      );
                    }, //goHome,
                    child: index == 0
                        ? Row(
                            children: [
                              const Text('Get your own KnoCard'),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.download_outlined,
                                size: 15.sp,
                              ),
                            ],
                          )
                        : const Text('Go home')),
              )),
        ],
      ),
    );
  }
}
