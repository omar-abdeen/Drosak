import 'package:drosak/core/resources/routes_mananger.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutesManager.routes,
      initialRoute: RoutesName.kSplashScreenRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
