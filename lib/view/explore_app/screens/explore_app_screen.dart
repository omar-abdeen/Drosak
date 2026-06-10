import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/view/explore_app/widgets/custom_appbar_explore_app_screen.dart';
import 'package:drosak/view/explore_app/widgets/custom_grid_view_of_item_explore_screen.dart';
import 'package:flutter/material.dart';

class ExploreAppScreen extends StatelessWidget {
  const ExploreAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.kBlackColor,
        appBar: CustomAppBarExploreAppScreen(),
        body: Column(
          children: [
            CustomGridViewOfItemExploreScreen(),
          ],
        ),
      ),
    );
  }
}
