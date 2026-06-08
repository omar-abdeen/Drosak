import 'package:drosak/model/onboarding/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItemOnboardingScreen extends StatelessWidget {
  const CustomItemOnboardingScreen({
    super.key, required this.onBoardingModel,
  });
    final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(onBoardingModel.image, height: 250, width: 250,),
            SizedBox(height: 72),
            Text(
                onBoardingModel.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'AA-GALAXY',
                  wordSpacing: 2,
                )
            ),
          ]
      ),
    );
  }
}