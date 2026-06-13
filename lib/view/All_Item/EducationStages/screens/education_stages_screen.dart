import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_app_bar.dart';
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
        body: Center(
          child: Text(
            ConstValue.kEducationalStages,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'ge_diner_one',
            ),
          ),
        ),
      ),
    );
  }
}
