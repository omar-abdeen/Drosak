import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:drosak/core/resources/padding_manager.dart';
import 'package:drosak/core/resources/radius_values_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.onSubmitted,
    this.maxLines = 1,
    required this.validator,
  });

  final TextEditingController controller;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;
  final int? maxLines;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmitted,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.br12),
        ),
        hintText: hintText,
        fillColor: ColorManager.kWhiteColor,
        filled: true,
        hintStyle: TextStyle(
          color: ColorManager.kBlackColor,
          fontSize: FontsSize.f14,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: PaddingManager.pw16,
          vertical: PaddingManager.ph12,
        ),
      ),
    );
  }
}
