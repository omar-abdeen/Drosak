import 'package:drosak/core/resources/assets_values_mananger.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsValuesManager.kOnBoardingImage1),
                SizedBox(height: 72),
                Text(
                    ConstValue.kOnBoardingText1,
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
        ),
      ),
    );
  }
}
