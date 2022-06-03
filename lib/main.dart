import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:knocard_ui/presentation/review/review_page.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/style/color.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: KColor.primaryColor,
          primarySwatch: const MaterialColor(0xFF088ac6, KColor.mapColor),
          scaffoldBackgroundColor: KColor.backgroundColor,
        ),
        home: const HomePage(),
      ),
    );
  }
}
