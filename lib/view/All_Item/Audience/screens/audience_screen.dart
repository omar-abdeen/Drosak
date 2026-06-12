import 'package:drosak/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class AudienceScreen extends StatelessWidget {
  const AudienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Audience Screen',
          style: TextStyle(fontSize: 20, color: ColorManager.kWhiteColor),
        ),
      ),
    );
  }
}
