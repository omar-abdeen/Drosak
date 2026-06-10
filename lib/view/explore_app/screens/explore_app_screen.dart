import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/view/explore_app/widgets/custom_appbar_explore_app_screen.dart';
import 'package:flutter/material.dart';

class ExploreAppScreen extends StatelessWidget {
  const ExploreAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.kBlackColor,
        appBar: CustomAppBarExploreAppScreen(),
        body: Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            itemCount: 5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 138 / 108,
              crossAxisCount: 2,
              crossAxisSpacing: 39,
              mainAxisSpacing: 34,
            ),
            itemBuilder: (context, index) => Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: -16,
                  left: -16,
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
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
                  ),
                ),
                Container(
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

                ),
                Positioned(
                  bottom: -16,
                  left: -16,
                  child: Center(
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  left: -10,
                  child: Center(
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: ColorManager.kPrimaryColor,
                      child: Text("1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'ge_diner_one',
                            fontWeight: FontWeight.w900,
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
