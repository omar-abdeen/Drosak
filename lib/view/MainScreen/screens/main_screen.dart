import 'package:drosak/core/resources/assets_values_mananger.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.kBlackLight,
        selectedItemColor: ColorManager.kPrimaryColor,
        unselectedItemColor: ColorManager.kGreyLight,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsValuesManager.kPaymentImageSvg),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsValuesManager.kTheAudienceImageSvg),
            label: 'The Audience',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsValuesManager.kStudentsImageSvg),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsValuesManager.kGroupsImageSvg),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsValuesManager.kEducationalStagesImageSvg,
            ),
            label: 'Educational Stages',
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: const Text('Main Screen'),
      //   centerTitle: true,
      // ),
    );
  }
}
