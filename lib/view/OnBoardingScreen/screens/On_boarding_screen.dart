import 'package:drosak/controller/OnBoarding/on_boarding_control.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/view/OnBoardingScreen/widgets/custom_nav_bar.dart';
import 'package:drosak/view/OnBoardingScreen/widgets/custom_page.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnBoardingControl _controller;

  @override
  void initState() {
    super.initState();
    _controller = OnBoardingControl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kWhiteColor,
      bottomNavigationBar: CustomBottomNavBar(
        onTap: () {
          _controller.skip(context);
        },
        onPressed: () {
          _controller.goNext();
        },
        count: ConstListValues.listOnBoardingModel.length,
        outputDotIndicator: _controller.outputDotIndicator,
      ),
      body: CustomPageViewOnBoarding(
        controller: _controller.pageControllerOnBoardingControl,
      ),
    );
  }
}
