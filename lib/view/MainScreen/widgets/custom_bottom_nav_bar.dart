import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/model/MainScreen/bottom_nav_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBarMainScreen extends StatelessWidget {
  const CustomBottomNavBarMainScreen({
    super.key,
    required this.listIcon,
    required this.onTap,
    required this.outPutBottomNavBar,
  });

  final List<BottomNavBarModel> listIcon;
  final ValueChanged<int> onTap;
  final Stream outPutBottomNavBar;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: outPutBottomNavBar,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          onTap: onTap,
          currentIndex: snapshot.data == null ? 0 : snapshot.data!,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorManager.kBlackLight,
          selectedItemColor: ColorManager.kPrimaryColor,
          unselectedItemColor: ColorManager.kGreyLight,
          items: [
            for (int i = 0; i < listIcon.length; i++)
              BottomNavigationBarItem(
                label: listIcon[i].text,
                icon: SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                    (snapshot.data!??0) == i
                        ? ColorManager.kPrimaryColor
                        : ColorManager.kGreyLight,
                    BlendMode.srcIn,
                  ),
                  listIcon[i].imageSvg,
                ),
              ),
          ],
        );
      },
    );
  }
}
