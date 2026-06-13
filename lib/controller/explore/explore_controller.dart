import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/core/resources/routes_mananger.dart';
import 'package:flutter/cupertino.dart';

class ExploreController {
  void goToMainScreen({required int index, required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutesName.kMainScreenRoute,
      arguments: {ConstValue.kScreenIndex: index},
    );
  }
}
