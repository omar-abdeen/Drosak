import 'package:drosak/core/resources/height_manager.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_app_bar.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_iteam_education_stages.dart';
import 'package:flutter/material.dart';

class EducationStagesScreen extends StatefulWidget {
  const EducationStagesScreen({super.key});

  @override
  State<EducationStagesScreen> createState() => _EducationStagesScreenState();
}

class _EducationStagesScreenState extends State<EducationStagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            SizedBox(height: HeightManager.h35),
            CustomItemEducationStages(),
          ],
        ),
      ),
    );
  }
}
