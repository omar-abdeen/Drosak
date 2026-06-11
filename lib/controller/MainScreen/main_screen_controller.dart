import 'package:drosak/core/resources/assets_values_mananger.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/model/MainScreen/bottom_nav_bar_model.dart';

class MainScreenController {
  static List<BottomNavBarModel> listBottomNavBarModel = [
    BottomNavBarModel(
      text: ConstValue.kPaying,
      imageSvg: AssetsValuesManager.kPaymentImageSvg,
    ),
    BottomNavBarModel(
      text: ConstValue.kEducationalStages,
      imageSvg: AssetsValuesManager.kEducationalStagesImageSvg,
    ),
    BottomNavBarModel(
      text: ConstValue.kStudents,
      imageSvg: AssetsValuesManager.kStudentsImageSvg,
    ),
    BottomNavBarModel(
      text: ConstValue.kGroups,
      imageSvg: AssetsValuesManager.kGroupsImageSvg,
    ),
    BottomNavBarModel(
      text: ConstValue.kTheAudience,
      imageSvg: AssetsValuesManager.kTheAudienceImageSvg,
    ),
  ];
}
