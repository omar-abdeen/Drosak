import 'package:drosak/controller/explore/explore_controller.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/view/explore_app/widgets/custom_appbar_explore_app_screen.dart';
import 'package:drosak/view/explore_app/widgets/custom_grid_view_of_item_explore_screen.dart';
import 'package:flutter/material.dart';

class ExploreAppScreen extends StatefulWidget {
  const ExploreAppScreen({super.key});

  @override
  State<ExploreAppScreen> createState() => _ExploreAppScreenState();
}

class _ExploreAppScreenState extends State<ExploreAppScreen> {
  late ExploreController exploreController;
  @override
  void initState() {
    super.initState();
    exploreController = ExploreController();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.kBlackColor,
        appBar: CustomAppBarExploreAppScreen(),
        body: Column(
          children: [
            CustomGridViewOfItemExploreScreen(
              onTap: () {
                exploreController.goToMainScreen('Main Screen', context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
