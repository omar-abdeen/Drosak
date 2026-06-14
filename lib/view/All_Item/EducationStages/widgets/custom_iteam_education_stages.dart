import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:drosak/core/resources/height_manager.dart';
import 'package:drosak/core/resources/margin_manager.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemEducationStages extends StatelessWidget {
  const CustomItemEducationStages({
    super.key,
    required this.itemEducationModel,
  });

  final EducationModel itemEducationModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  child: Image.asset(
                    itemEducationModel.image,
                    width: 90.w,
                    height: 90.h,
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
    );
  }
}
