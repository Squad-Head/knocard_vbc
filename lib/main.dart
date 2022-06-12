import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/style/color.dart';

import 'presentation/home/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
=======
import 'package:go_router/go_router.dart';
import 'package:knocard_ui/presentation/community/community_page.dart';

void main() {
  runApp(MyApp());
>>>>>>> 224312bc239d32328ff1b0a581fec5940769edd8
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
<<<<<<< HEAD
      //designSize: const Size(360, 800),
      designSize: const Size(1034, 620),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: KColor.primaryColor,
          primarySwatch: const MaterialColor(0xFF088ac6, KColor.mapColor),
          scaffoldBackgroundColor: KColor.backgroundColor,
        ),
        home: const HomePage(),
        // home: const ContactPage(),
      ),
    );
  }
=======
      designSize: const Size(360, 690),
      builder: () {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routeInformationParser: _goRouter.routeInformationParser,
          routerDelegate: _goRouter.routerDelegate,
          builder: (context, child) {
            ScreenUtil.setContext(context);
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child!);
          },
        );
      },
    );
  }

  final GoRouter _goRouter = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) =>
            const CommuniyPage(),
      ),
    ],
  );
>>>>>>> 224312bc239d32328ff1b0a581fec5940769edd8
}
