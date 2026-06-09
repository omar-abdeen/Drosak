import 'package:dots_indicator/dots_indicator.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:drosak/core/resources/height_manager.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key, required this.count, required this.position,
  });
  final int count;
  final double position;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: HeightManager.h20,
        vertical: HeightManager.h10,
      ),
      height: HeightManager.h50,
      color: ColorManager.kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ConstValue.kSkip,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: ColorManager.kWhiteColor,
              fontSize: FontsSize.f15,
            ),
          ),
          DotsIndicator(
            dotsCount: count,
            position: position,
            decorator: DotsDecorator(
              color: ColorManager.kPrimaryColor.withRed(150),
              activeColor: ColorManager.kWhiteColor,
              size: const Size.square(9.0),
              activeSize: const Size(10, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          Text(
            ConstValue.kNext,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: ColorManager.kWhiteColor,
              fontSize: FontsSize.f15,
            ),
          ),
        ],
      ),
    );
  }
}