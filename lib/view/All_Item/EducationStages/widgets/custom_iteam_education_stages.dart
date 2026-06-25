import 'dart:io';

import 'package:drosak/core/resources/assets_values_mananger.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:drosak/core/resources/height_manager.dart';
import 'package:drosak/core/resources/margin_manager.dart';
import 'package:drosak/core/resources/radius_values_manager.dart';
import 'package:drosak/core/resources/width_manager.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomItemEducationStages extends StatelessWidget {
  const CustomItemEducationStages({
    super.key,
    required this.itemEducationModel,
    required this.onDeleteItem,
    required this.onEditItem,
  });

  final EducationModel itemEducationModel;
  final void Function(EducationModel itemEducationModel) onDeleteItem;
  final void Function(EducationModel itemEducationModel) onEditItem;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDeleteItem(itemEducationModel);
        } else if (direction == DismissDirection.startToEnd) {
          onEditItem(itemEducationModel);
        }
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: WidthManager.w20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: WidthManager.w20),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      key: Key(itemEducationModel.id.toString()),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -27,
            right: 8,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.kPrimaryColor2,
                    blurRadius: 5,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MarginManager.mw16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.kPrimaryColor2,
                  blurRadius: 5,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 22.w,
                top: 8.h,
                bottom: 8.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemEducationModel.StagesName,
                          style: TextStyle(
                            color: ColorManager.kWhiteColor,
                            fontSize: FontsSize.f20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: HeightManager.h5),
                        Text(
                          itemEducationModel.desc,
                          style: TextStyle(
                            color: ColorManager.kWhiteColor.withOpacity(0.7),
                            fontSize: FontsSize.f10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      RadiusValuesManager.br50,
                    ),
                    child: Image.file(
                      errorBuilder: (context, error, stackTrace) =>
                          SvgPicture.asset(
                            AssetsValuesManager.kPlaceholderSvg,
                            width: WidthManager.w70,
                          ),
                      File(itemEducationModel.image),
                      width: WidthManager.w70,
                      height: HeightManager.h70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -29,
            right: 7,
            child: Center(
              child: CircleAvatar(
                radius: 22,
                backgroundColor: ColorManager.kBlackColor,
              ),
            ),
          ),
          Positioned(
            top: -25,
            right: 10.8,
            child: Center(
              child: CircleAvatar(
                radius: 18,
                backgroundColor: ColorManager.kPrimaryColor,
                child: Text(
                  itemEducationModel.id.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: FontsSize.f15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
