import 'package:drosak/core/resources/routes_mananger.dart';
import 'package:flutter/cupertino.dart';

class ExploreController {
    void goToMainScreen(String name, BuildContext context) {
      Navigator.of(context).pushNamed(RoutesName.kMainScreenRoute);
    }
}