import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart' hide MenuItem;
import 'package:image_network/image_network.dart';
import 'package:knocard_ui/style/color.dart';

class HeaderBackground extends StatelessWidget {
  final String coverPhoto;
  const HeaderBackground({Key? key, required this.coverPhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Column(
            children: [
              coverPhoto.isEmpty
                  ? Container(
                      height: 120,
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
                      image: coverPhoto,
                      imageCache: CachedNetworkImageProvider(coverPhoto),
                      height: 120,
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
                      const Text(
                        "Brett Flemming",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      const Text(
                        "Contractor",
                        style: TextStyle(
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
              'Dale\'s home services',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
          ),
          Positioned(
            left: 40.w,
            top: 60.h,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.white)),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWR89EvH9ioXbj_sjTwDAroSfvJVyNaN6tOgTlUQVrgkMBcSjQUAW-RlficXlTSfPQR7Q&usqp=CAU'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
