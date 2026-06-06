import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("dmovmomdoxm"),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Image(image: AssetImage(AssetsValuesManager.kSplashBorderImage)),
        //     Image(image: AssetImage(AssetsValuesManager.kLogoImage)),
        //     Align(
        //       alignment: Alignment.bottomRight,
        //       child: Image(
        //         image: AssetImage(AssetsValuesManager.kSplashBorderImageBottom),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
