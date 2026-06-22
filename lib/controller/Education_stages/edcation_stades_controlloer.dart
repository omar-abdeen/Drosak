import 'dart:async';

import 'package:drosak/core/database/sqflite/Eduction_Stages/eduction_stages_oprations.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EducationStatesController {
  List<EducationModel> listEducationModel = [];
  TextEditingController controllerAddEducation = TextEditingController();
  TextEditingController controllerDescEducation = TextEditingController();
  String? imagePath;
  late StreamController<List<EducationModel>> controllerEducationStages;
  late Sink<List<EducationModel>> inputEducationStages;
  late Stream<List<EducationModel>> outputEducationStages;
  late StreamController<String?> controllerImagePath;
  late Sink<String?> inputImagePath;
  late Stream<String?> outputImagePath;

  EducationStatesController() {
    initialize();
  }
  void ControllerEducation() {
    controllerEducationStages = StreamController();
    inputEducationStages = controllerEducationStages.sink;
    outputEducationStages = controllerEducationStages.stream
        .asBroadcastStream();
    inputEducationStages.add(listEducationModel);
    controllerImagePath = StreamController();
    inputImagePath = controllerImagePath.sink;
    outputImagePath = controllerImagePath.stream;
    inputImagePath.add(imagePath);
  }

  void disposeController() {
    controllerEducationStages.close();
    inputEducationStages.close();
    controllerImagePath.close();
    inputImagePath.close();
  }

  void initialize() async {
    ControllerEducation();
    EductionStagesOprations eductionStagesOprations = EductionStagesOprations();
    listEducationModel = await eductionStagesOprations.getAllEductionStages();
    inputEducationStages.add(listEducationModel);
  }

  void pickerImage() async {
    final picker = ImagePicker();
    // Pick an image.
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = image.path;
    }
    inputImagePath.add(imagePath);
    // Capture a photo.
    // var photo = await picker.pickImage(source: ImageSource.camera);
  }

  void openBottomSheet({required BuildContext context}) {
    showBottomSheet(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: CustomShowBottomSheet(
          outputImagePath: outputImagePath,
          onPressedDeleteImage: () {
            imagePath = null;
            inputImagePath.add(imagePath);
          },
          onPressedPickImage: () {
            pickerImage();
          },
          controllerNameEduction: controllerAddEducation,
          controllerDesEduction: controllerDescEducation,
          onPressedAdd: () {
            addNewEducation();
          },
        ),
      ),
    );
  }

  void addNewEducation() async {
    EductionStagesOprations eductionStagesOprations = EductionStagesOprations();
    print(imagePath);
    // ignore: unused_local_variable
    bool inserted = await eductionStagesOprations.insertEductionStages(
      EducationModel(
        id: listEducationModel.length + 1,
        StagesName: controllerAddEducation.text,
        desc: controllerDescEducation.text,
        image: imagePath == null ? "" : imagePath!,
      ),
    );
    print({"inserted": inserted});
  }
}
