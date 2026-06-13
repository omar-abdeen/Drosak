import 'dart:async';

import 'package:drosak/core/resources/assets_values_mananger.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/model/MainScreen/bottom_nav_bar_model.dart';
import 'package:drosak/view/All_Item/EducationStages/screens/education_stages_screen.dart';
import 'package:drosak/view/All_Item/Groups/screens/groups_screen.dart';
import 'package:drosak/view/All_Item/Paying/screens/paying_screen.dart';
import 'package:drosak/view/All_Item/Students/screens/students_screen.dart';
import 'package:drosak/view/All_Item/The_Audience/screens/the_aufience_screen.dart';
import 'package:flutter/cupertino.dart';

class MainScreenController {
  int currentIndexScreen = 0;

  // body controller
  late StreamController<int> controllerBody;
  late Sink<int> inputBody;
  late Stream<int> outputBody;

  // bottom nav bar controller
  late StreamController<int> controllerBottomNavBar;
  late Sink<int> inputBottomNavBar;
  late Stream<int> outputBottomNavBar;

  MainScreenController() {
    controllerBody = StreamController();
    inputBody = controllerBody.sink;
    outputBody = controllerBody.stream;
    inputBody.add(currentIndexScreen);
    controllerBottomNavBar = StreamController();
    inputBottomNavBar = controllerBottomNavBar.sink;
    outputBottomNavBar = controllerBottomNavBar.stream;
    inputBottomNavBar.add(currentIndexScreen);
  }

  void disposeController() {
    inputBody.close();
    controllerBody.close();

    inputBottomNavBar.close();
    controllerBottomNavBar.close();
  }
  void gertArgument(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    currentIndexScreen = int.parse(arg[ConstValue.kScreenIndex].toString());
    inputBody.add(currentIndexScreen);
    inputBottomNavBar.add(currentIndexScreen);
  }
  static List<BottomNavBarModel> listBottomNavBarModel = [
    BottomNavBarModel(
      screen: EducationStagesScreen(),
      text: ConstValue.kEducationalStages,
      imageSvg: AssetsValuesManager.kEducationalStagesImageSvg,
    ),
    BottomNavBarModel(
      screen: GroupsScreen(),
      text: ConstValue.kGroups,
      imageSvg: AssetsValuesManager.kGroupsImageSvg,
    ),
    BottomNavBarModel(
      screen: StudentsScreen(),
      text: ConstValue.kStudents,
      imageSvg: AssetsValuesManager.kStudentsImageSvg,
    ),
    BottomNavBarModel(
      screen: TheAudienceScreen(),
      text: ConstValue.kTheAudience,
      imageSvg: AssetsValuesManager.kTheAudienceImageSvg,
    ),
    BottomNavBarModel(
      screen: PayingScreen(),
      text: ConstValue.kPaying,
      imageSvg: AssetsValuesManager.kPaymentImageSvg,
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndexScreen = index;
    inputBody.add(currentIndexScreen);
    inputBottomNavBar.add(currentIndexScreen);
  }
}
