
import 'package:drosak/controller/Education_stages/edcation_stades_controlloer.dart';
import 'package:drosak/core/database/sqflite/Eduction_Stages/eduction_stages_oprations.dart';
import 'package:drosak/core/resources/height_manager.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_iteam_education_stages.dart';
import 'package:flutter/material.dart';

class CustomListViewEducationStages extends StatefulWidget {
  const CustomListViewEducationStages({
    super.key,
  });

  @override
  State<CustomListViewEducationStages> createState() => _CustomListViewEducationStagesState();
}

class _CustomListViewEducationStagesState extends State<CustomListViewEducationStages> {
  late EducationStatesController _educationStatesController;
  @override
  void initState() {
    super.initState();
    _educationStatesController = EducationStatesController();
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: HeightManager.h35),
        itemBuilder: (context, index) => CustomItemEducationStages(
          itemEducationModel: _educationStatesController.listEducationModel[index],
        ),
        separatorBuilder: (context, index) =>
            SizedBox(height: HeightManager.h35),
        itemCount: _educationStatesController.listEducationModel.length,
      ),
    );
  }
}
