import 'package:drosak/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
class CustomShadowContainerExploreScreen extends StatelessWidget {
  const CustomShadowContainerExploreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -16,
      left: -16,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: ColorManager.kPrimaryColor2,
              blurRadius: 15,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
      ),
    );
  }
}
