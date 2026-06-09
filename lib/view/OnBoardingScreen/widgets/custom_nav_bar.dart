import 'package:dots_indicator/dots_indicator.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:drosak/core/resources/height_manager.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.count,
    this.onPressed,
    required this.outputDotIndicator, this.onTap,
  });

  final int count;
  final VoidCallback? onPressed;
  final GestureTapCallback? onTap;
  final Stream<int> outputDotIndicator;

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
          InkWell(
            onTap: onTap,
            child: Text(
              ConstValue.kSkip,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: ColorManager.kWhiteColor,
                fontSize: FontsSize.f15,
              ),
            ),
          ),
          StreamBuilder<int>(
            stream: outputDotIndicator,
            builder: (context, snapshot)  => DotsIndicator(
                dotsCount: count,
                position: snapshot.data==null ? 0 : snapshot.data!.toDouble(),
                decorator: DotsDecorator(
                  color: ColorManager.kPrimaryColor.withRed(150),
                  activeColor: ColorManager.kWhiteColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(10, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              ConstValue.kNext,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: ColorManager.kWhiteColor,
                fontSize: FontsSize.f15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
