import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/view/OnBoardingScreen/widgets/custom_item_on_boarding_screen.dart';
import 'package:drosak/view/OnBoardingScreen/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  CustomBottomNavBar(
        count: ConstListValues.listOnBoardingModel.length,
        position: 0,
      ),
      body: PageView.builder(
        itemCount: ConstListValues.listOnBoardingModel.length,
        itemBuilder: (context, index) => CustomItemOnboardingScreen(
          onBoardingModel: ConstListValues.listOnBoardingModel[index],
        ),
      ),
    );
  }
}
