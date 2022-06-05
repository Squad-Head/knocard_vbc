import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:knocard_ui/presentation/home/home_page.dart';
import 'package:knocard_ui/presentation/home_services/home_services.dart';
import 'package:knocard_ui/presentation/review/review_page.dart';

import 'package:knocard_ui/style/color.dart';
import 'package:knocard_ui/web/w_home_page/w_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //designSize: const Size(360, 800),
      designSize: const Size(1034, 620),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: const MaterialColor(0xFF088ac6, KColor.mapColor),
          scaffoldBackgroundColor: KColor.backgroundColor,
        ),
        //home: const HomePage(),
        home: WHomePage(),
      ),
    );
  }
}
