import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/routes_mananger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: ColorManager.kBlackColor,
          ),
        routes: RoutesManager.routes,
        initialRoute: RoutesName.kExploreAppScreen,
        debugShowCheckedModeBanner: false,
            ),
      );
  }
}
