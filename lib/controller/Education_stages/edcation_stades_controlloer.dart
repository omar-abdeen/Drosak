import 'package:drosak/model/Education/education_model.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_show_bottom_sheet.dart';
import 'package:flutter/material.dart';

class EducationStatesController {
  List<EducationModel> listEducationModel = [
    EducationModel(
      id: 1,
      StagesName: "الصف مؤىخرى خ",
      desc: "ثيمللاعهيلاخ0ريملاهخلا ",
      image: "assets/images/test.png",
    ),
    EducationModel(
      id: 2,
      StagesName: "الصف مؤىخرى خ",
      desc: "ثيمللاعهيلاخ0ريملاهخلا ",
      image: "assets/images/test.png",
    ),
    EducationModel(
      id: 3,
      StagesName: "الصف مؤىخرى خ",
      desc: "ثيمللاعهيلاخ0ريملاهخلا ",
      image: "assets/images/test.png",
    ),
  ];
  TextEditingController controllerAddEducation = TextEditingController();
  TextEditingController controllerDescEducation = TextEditingController();

  void openBottomSheet({required BuildContext context}) {
    showBottomSheet(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: CustomShowBottomSheet(
          controllerNameEduction: controllerAddEducation,
          controllerDesEduction: controllerDescEducation,
        ),
      ),
    );
  }

  void addToNewEducationToDatabase() {}
}
