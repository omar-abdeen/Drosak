import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/view/OnBoardingScreen/widgets/custom_item_on_boarding_screen.dart';
import 'package:flutter/material.dart';

class CustomPageViewOnBoarding extends StatelessWidget {
  const CustomPageViewOnBoarding({
    super.key, required this.controller,
  });
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: ConstListValues.listOnBoardingModel.length,
      itemBuilder: (context, index) => CustomItemOnboardingScreen(
        onBoardingModel: ConstListValues.listOnBoardingModel[index],
      ),
    );
  }
}