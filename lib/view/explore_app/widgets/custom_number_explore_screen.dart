import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:flutter/material.dart';

class CustomNumberExploreScreen extends StatelessWidget {
  const CustomNumberExploreScreen({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -10,
      left: -10,
      child: Center(
        child: CircleAvatar(
          radius: 10,
          backgroundColor: ColorManager.kPrimaryColor,
          child: Text(
            number.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: FontsName.geDinerOneFont,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
