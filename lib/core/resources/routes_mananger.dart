import 'package:drosak/view/All_Item/Audience/screens/audience_screen.dart';
import 'package:drosak/view/All_Item/EducationStages/screens/education_stages_screen.dart';
import 'package:drosak/view/All_Item/Groups/screens/groups_screen.dart';
import 'package:drosak/view/All_Item/Paying/screens/paying_screen.dart';
import 'package:drosak/view/All_Item/Students/screens/students_screen.dart';
import 'package:drosak/view/MainScreen/screens/main_screen.dart';
import 'package:drosak/view/OnBoardingScreen/screens/On_boarding_screen.dart';
import 'package:drosak/view/explore_app/screens/explore_app_screen.dart';
import 'package:drosak/view/splash_screen/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static Map<String, WidgetBuilder> routes = {
    RoutesName.kSplashScreenRoute: (context) => SplashScreen(),
    RoutesName.kOnBoardingScreenRoute: (context) => OnBoardingScreen(),
    RoutesName.kMainScreenRoute: (context) => MainScreen(),
    RoutesName.kExploreAppScreen: (context) => ExploreAppScreen(),
    RoutesName.kGroupsRoute: (context) => GroupsScreen(),
    RoutesName.kAudienceRoute: (context) => AudienceScreen(),
    RoutesName.kStudentsRoute: (context) => StudentsScreen(),
    RoutesName.kEducationStagesRoute: (context) => EducationStagesScreen(),
    RoutesName.kPayingRoute: (context) => PayingScreen(),
    // RoutesName.kAddNewGroupScreen: (context) => const AddNewGroupScreen(),
    // RoutesName.kAddNewStudentsScreen: (context) => const AddNewStudentsScreen(),
  };
}

class RoutesName {
  static String kSplashScreenRoute = '/kSplashScreenRoute';
  static String kOnBoardingScreenRoute = '/kOnBoardingScreenRoute';
  static String kExploreAppScreen = '/kExploreAppScreen';
  static String kMainScreenRoute = '/kMainScreenRoute';
  static String kPayingRoute = '/kPayingRoute';
  static String kEducationStagesRoute = '/kEducationStagesRoute';
  static String kAudienceRoute = '/kAudienceRoute';
  static String kGroupsRoute = '/kGroupsRoute';
  static String kStudentsRoute = '/kMainScreen';
  static String kAddNewGroupScreen = '/kAddNewGroupScreen';
  static String kAddNewStudentsScreen = '/kAddStudentsScreen';
}
