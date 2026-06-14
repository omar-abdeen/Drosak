import 'package:drosak/core/resources/assets_values_mananger.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:drosak/core/resources/radius_values_manager.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EducationStatesController {
  List<EducationModel> listEducationModel = [
    EducationModel(
      id: 1,
      StagesName: "الصف مؤىخرى خ",
      desc: "ثيمللاعهيلاخ0ريملاهخلا ",
      image: "assets/images/test.png",
    ),
    EducationModel(
      id: 2,
      StagesName: "الصف مؤىخرى خ",
      desc: "ثيمللاعهيلاخ0ريملاهخلا ",
      image: "assets/images/test.png",
    ),
    EducationModel(
      id: 3,
      StagesName: "الصف مؤىخرى خ",
      desc: "ثيمللاعهيلاخ0ريملاهخلا ",
      image: "assets/images/test.png",
    ),
  ];

  void openBottomSheet({required BuildContext context}) {
    showBottomSheet(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: ColorManager.kBlackLight,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        RadiusValuesManager.br12,
                      ),
                    ),
                    hintText: "اسم المرحلة التعليمية",
                    fillColor: ColorManager.kWhiteColor,
                    filled: true,
                    hintStyle: TextStyle(
                      color: ColorManager.kBlackColor,
                      fontSize: FontsSize.f14,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
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
                  colorFilter:  ColorFilter.mode(
                    ColorManager.kWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
