import 'package:drosak/core/database/sqflite/Eduction_Stages/eduction_stages_oprations.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_show_bottom_sheet.dart';
import 'package:flutter/material.dart';

class EducationStatesController {
  List<EducationModel> listEducationModel = [
  ];
  TextEditingController controllerAddEducation = TextEditingController();
  TextEditingController controllerDescEducation = TextEditingController();
  final EductionStagesOprations eductionStagesOprations;
  EducationStatesController(this.eductionStagesOprations) {
    initialize();
  }
  void initialize() async {
    var listEducationModel = await eductionStagesOprations
        .getAllEductionStages();
    print("listEducationModel: $listEducationModel");
  }

  void openBottomSheet({required BuildContext context}) {
    showBottomSheet(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: CustomShowBottomSheet(
          controllerNameEduction: controllerAddEducation,
          controllerDesEduction: controllerDescEducation,
          onPressed: () {
            addNewEducation();
          },
        ),
      ),
    );
  }

  void addNewEducation() async {
    // ignore: unused_local_variable
    bool inserted = await eductionStagesOprations.insertEductionStages(
      EducationModel(
        id: listEducationModel.length + 1,
        StagesName: controllerAddEducation.text,
        desc: controllerDescEducation.text,
        image: "assets/images/test.png",
      ),
    );
  }
}
