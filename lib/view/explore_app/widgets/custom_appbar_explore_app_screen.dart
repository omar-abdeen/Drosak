import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBarExploreAppScreen extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarExploreAppScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(ConstValue.kExploreApp,
        style: TextStyle(
          color: ColorManager.kPrimaryColor,
          fontSize: FontsSize.f20,
          fontFamily: FontsName.geDinerOneFont,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}