import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:drosak/core/resources/height_manager.dart';
import 'package:drosak/model/explore/explore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomContainerOnNameAndImageExploreScreen extends StatelessWidget {
  const CustomContainerOnNameAndImageExploreScreen({
    super.key, required this.exploreScreenModel,
  });
  final ExploreScreenModel exploreScreenModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
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
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            height: 25,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorManager.kPrimaryColor,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            child: Text(
              exploreScreenModel.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: FontsName.geDinerOneFont,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: HeightManager.h10),
          SvgPicture.asset(
            exploreScreenModel.image,
            height: HeightManager.h63,
          ),
        ],
      ),
    );
  }
}
