import 'package:drosak/view/OnBoardingScreen/screens/On_boarding_screen.dart';
import 'package:drosak/view/splash_screen/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class RoutesManager {
  static Map<String, WidgetBuilder> routes = {
    RoutesName.kSplashScreenRoute: (context) => const SplashScreen(),
    RoutesName.kOnBoardingScreenRoute: (context) => const OnBoardingScreen(),
    // RoutesName.kMainScreenRoute: (context) => const MainScreen(),
    // RoutesName.kExploreAppScreenRoute: (context) => const ExploreAppScreen(),
    // RoutesName.kGroupsRoute: (context) => const GroupsScreen(),
    // RoutesName.kAudienceRoute: (context) => const AudienceScreen(),
    // RoutesName.kStudentsRoute: (context) => const StudentsScreen(),
    // RoutesName.kEducationStagesRoute: (context) =>
    //     const EducationStagesScreen(),
    // RoutesName.kPayingRoute: (context) => const PayingScreen(),
    // RoutesName.kAddNewGroupScreen: (context) => const AddNewGroupScreen(),
    // RoutesName.kAddNewStudentsScreen: (context) => const AddNewStudentsScreen(),
  };
}

class RoutesName {
  static const String kSplashScreenRoute = '/kSplashScreenRoute';
  static const String kOnBoardingScreenRoute = '/kOnBoardingScreenRoute';
  static const String kExploreAppScreenRoute = '/kExploreAppScreenRoute';
  static const String kMainScreenRoute = '/kMainScreenRoute';
  static const String kPayingRoute = '/kPayingRoute';
  static const String kEducationStagesRoute = '/kEducationStagesRoute';
  static const String kAudienceRoute = '/kAudienceRoute';
  static const String kGroupsRoute = '/kGroupsRoute';
  static const String kStudentsRoute = '/kMainScreen';
  static const String kAddNewGroupScreen = '/kAddNewGroupScreen';
  static const String kAddNewStudentsScreen = '/kAddStudentsScreen';
}
