import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/presentation/groups/groups.dart';
import 'package:knocard_ui/presentation/home/home_page.dart';
import 'package:knocard_ui/presentation/community/community_page.dart';
import 'package:knocard_ui/presentation/contact/contact_page.dart';
import 'package:knocard_ui/presentation/messages/messages.dart';
import 'package:knocard_ui/style/color.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: KColor.primaryColor,
            scaffoldBackgroundColor: KColor.backgroundColor),
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        home: const HomePage(),
      ),
    );
  }
}
