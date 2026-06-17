import 'package:drosak/core/resources/assets_values_mananger.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/core/resources/height_manager.dart';
import 'package:drosak/core/resources/radius_values_manager.dart';
import 'package:drosak/core/widgets/buttons/custom_material_button.dart';
import 'package:drosak/core/widgets/input_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomShowBottomSheet extends StatelessWidget {
  const CustomShowBottomSheet({
    super.key,
    required this.controllerNameEduction,
    required this.controllerDesEduction,
  });

  final TextEditingController controllerNameEduction;
  final TextEditingController controllerDesEduction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      width: double.infinity,
      height: 250.h,
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(RadiusValuesManager.br12),
          topRight: Radius.circular(RadiusValuesManager.br12),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.kPrimaryColor2,
            blurRadius: 5,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: controllerNameEduction,
                  hintText: ConstValue.kNameEducationalStages,
                  onSubmitted: (value) {},
                ),
              ),
              SizedBox(width: 6.w),
              IconButton.filled(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: ColorManager.kPrimaryColor,
                ),
                icon: SvgPicture.asset(
                  AssetsValuesManager.assetsImagesPlaceholderSvg,
                  colorFilter: ColorFilter.mode(
                    ColorManager.kWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: HeightManager.h16),
          CustomTextFormField(
            maxLines: 2,
            controller: controllerDesEduction,
            hintText: ConstValue.kDescEducationalStage,
            onSubmitted: (value) {},
          ),
          SizedBox(height: HeightManager.h20),
          CustomMaterialButton(onPressed: () {}, text: ConstValue.kAdd),
        ],
      ),
    );
  }
}
