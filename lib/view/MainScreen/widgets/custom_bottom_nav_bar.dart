import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/model/MainScreen/bottom_nav_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBarMainScreen extends StatelessWidget {
  const CustomBottomNavBarMainScreen({
    super.key,
    required this.listIcon,
  });

  final List<BottomNavBarModel> listIcon;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorManager.kBlackLight,
      selectedItemColor: ColorManager.kPrimaryColor,
      unselectedItemColor: ColorManager.kGreyLight,
      items: [
        for (int i = 0; i < listIcon.length; i++)
          BottomNavigationBarItem(
            label: listIcon[i].text,
            icon: SvgPicture.asset(listIcon[i].imageSvg),
          ),
      ],
    );
  }
}
