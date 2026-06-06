import 'package:drosak/core/resources/assets_values_mananger.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/routes_mananger.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> _animationTop;
  late Animation<Offset> _animationBotton;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.pushReplacementNamed(context, RoutesName.kOnBoardingScreenRoute);
      }
    });
    _animationTop = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
        _animationBotton = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBlackColor,
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideTransition(
              position: _animationBotton,
              child: Image(
                image: AssetImage(AssetsValuesManager.kSplashBorderImage),
              ),
            ),
            Image(image: AssetImage(AssetsValuesManager.kLogoImage)),
            Align(
              alignment: Alignment.bottomRight,
              child: SlideTransition(
                position: _animationTop,
                child: Image(
                  image: AssetImage(
                    AssetsValuesManager.kSplashBorderImageBottom,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
