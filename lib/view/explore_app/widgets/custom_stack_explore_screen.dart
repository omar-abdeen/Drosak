import 'package:drosak/view/explore_app/widgets/custom_container_on_name_and_image_explore_screen.dart';
import 'package:drosak/view/explore_app/widgets/custom_number_explore_screen.dart';
import 'package:drosak/view/explore_app/widgets/custom_shadow_containter_explore_screen.dart';
import 'package:flutter/material.dart';

class CustomStackExploreScreen extends StatelessWidget {
  const CustomStackExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomShadowContainerExploreScreen(),
        CustomContainerOnNameAndImageExploreScreen(),
        Positioned(
          bottom: -16,
          left: -16,
          child: Center(
            child: CircleAvatar(radius: 16, backgroundColor: Colors.black),
          ),
        ),
        CustomNumberExploreScreen(),
      ],
    );
  }
}
