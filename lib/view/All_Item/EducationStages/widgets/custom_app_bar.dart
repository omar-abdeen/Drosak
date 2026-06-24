import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onPressedAddCircle,
    this.onPressedSearch,
  });
  final VoidCallback? onPressedAddCircle;
  final VoidCallback? onPressedSearch;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.kPrimaryColor,
      iconTheme: IconThemeData(color: Colors.white, size: 30),
      title: Row(
        children: [
          Text(
            ConstValue.kEducationalStages,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'ge_diner_one',
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: onPressedAddCircle,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: onPressedSearch,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
