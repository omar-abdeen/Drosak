import 'package:drosak/view/explore_app/widgets/custom_stack_explore_screen.dart';
import 'package:flutter/material.dart';

class CustomGridViewOfItemExploreScreen extends StatelessWidget {
  const CustomGridViewOfItemExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 138 / 108,
          crossAxisCount: 2,
          crossAxisSpacing: 39,
          mainAxisSpacing: 34,
        ),
        itemBuilder: (context, index) => CustomStackExploreScreen(),
      ),
    );
  }
}
