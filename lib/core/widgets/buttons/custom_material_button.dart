import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:drosak/core/resources/padding_manager.dart';
import 'package:drosak/core/resources/radius_values_manager.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(
        horizontal: PaddingManager.pw42,
        vertical: PaddingManager.ph10,
      ),
      onPressed: onPressed,
      color: ColorManager.kPrimaryColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusValuesManager.br12),
        borderSide: BorderSide.none,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: ColorManager.kWhiteColor,
          fontSize: FontsSize.f16,
          fontWeight: FontWeight.bold,
          fontFamily: FontsName.geDinerOneFont,
        ),
      ),
    );
  }
}
