import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/view/explore_app/widgets/custom_stack_explore_screen.dart';
import 'package:flutter/material.dart';

class CustomGridViewOfItemExploreScreen extends StatelessWidget {
  const CustomGridViewOfItemExploreScreen({super.key, this.onTap});
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        itemCount:ConstListValues.listExploreScreenModel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 138 / 108,
          crossAxisCount: 2,
          crossAxisSpacing: 39,
          mainAxisSpacing: 34,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: onTap ,
          child: CustomStackExploreScreen(
            number: index + 1,
            exploreScreenModel: ConstListValues.listExploreScreenModel[index],
          ),
        ),
      ),
    );
  }
}
