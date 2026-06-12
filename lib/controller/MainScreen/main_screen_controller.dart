import 'dart:async';

import 'package:drosak/core/resources/assets_values_mananger.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/model/MainScreen/bottom_nav_bar_model.dart';
import 'package:drosak/view/All_Item/EducationStages/screens/education_stages_screen.dart';
import 'package:drosak/view/All_Item/Groups/screens/groups_screen.dart';
import 'package:drosak/view/All_Item/Paying/screens/paying_screen.dart';
import 'package:drosak/view/All_Item/Students/screens/students_screen.dart';
import 'package:drosak/view/All_Item/The_Audience/screens/the_aufience_screen.dart';


class MainScreenController {
  int currentIndexScreen = 0;
  late StreamController<int> controllerBody;
  late Sink<int> inputBody;
  late Stream <int> outputBody;
  MainScreenController() {
    controllerBody = StreamController();
    inputBody = controllerBody.sink;
    outputBody = controllerBody.stream;
    inputBody.add(currentIndexScreen);
  }
  void disposeController() {
    inputBody.close();
    controllerBody.close();
  }

  static List<BottomNavBarModel> listBottomNavBarModel = [
    BottomNavBarModel(
      screen: PayingScreen(),
      text: ConstValue.kPaying,
      imageSvg: AssetsValuesManager.kPaymentImageSvg,
    ),
    BottomNavBarModel(
      screen: EducationStagesScreen(),
      text: ConstValue.kEducationalStages,
      imageSvg: AssetsValuesManager.kEducationalStagesImageSvg,
    ),
    BottomNavBarModel(
      screen: StudentsScreen(),
      text: ConstValue.kStudents,
      imageSvg: AssetsValuesManager.kStudentsImageSvg,
    ),
    BottomNavBarModel(
      screen: GroupsScreen(),
      text: ConstValue.kGroups,
      imageSvg: AssetsValuesManager.kGroupsImageSvg,
    ),
    BottomNavBarModel(
      screen: TheAudienceScreen(),
      text: ConstValue.kTheAudience,
      imageSvg: AssetsValuesManager.kTheAudienceImageSvg,
    ),
  ];
  void changeBottomNavBar(int index) {
    currentIndexScreen = index;
    inputBody.add(currentIndexScreen);
  }
}
