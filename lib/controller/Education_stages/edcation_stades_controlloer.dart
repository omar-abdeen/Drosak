import 'dart:async';
import 'dart:io';

import 'package:drosak/core/database/sqflite/Eduction_Stages/eduction_stages_oprations.dart';
import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_search)eduction_stages.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class EducationStatesController {
  // 1. نسخة وحيدة وثابتة من الـ Controller
  static final EducationStatesController _instance =
  EducationStatesController._internal();

  // 2. Factory constructor عشان يرجع نفس النسخة في كل مكان
  factory EducationStatesController() {
    return _instance;
  }

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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EducationStatesController._internal() {
    initialize();
  }

  void ControllerEducation() {
    controllerEducationStages =
    StreamController<List<EducationModel>>.broadcast();
    inputEducationStages = controllerEducationStages.sink;
    outputEducationStages = controllerEducationStages.stream
        .asBroadcastStream();

    inputEducationStages.add(listEducationModel);

    controllerImagePath = StreamController<String?>.broadcast();
    inputImagePath = controllerImagePath.sink;
    outputImagePath = controllerImagePath.stream.asBroadcastStream();
    inputImagePath.add(imagePath);
  }

  void disposeController() {
    // لا نغلق الـ Streams لأن الـ Controller هو Singleton ويستخدم في عدة شاشات
    controllerAddEducation.clear();
    controllerDescEducation.clear();
    imagePath = null;
    inputImagePath.add(null);
  }

  void initialize() async {
    ControllerEducation();
    getAllEducationStages();
  }

  void getAllEducationStages() async {
    EductionStagesOprations eductionStagesOprations = EductionStagesOprations();
    listEducationModel = await eductionStagesOprations.getAllEductionStages();
    inputEducationStages.add(listEducationModel);
  }

  void pickerImage(ImageSource source) async {
    final picker = ImagePicker();
    var image = await picker.pickImage(source: source);
    if (image != null) {
      imagePath = image.path;
      saveImageOfMyApp(image);
    }
    inputImagePath.add(imagePath);
  }

  void saveImageOfMyApp(XFile image) async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = directory.path;
    var finalPath = '$path/${image.name}';
    File filePath = await File(image.path).copy(finalPath);
    imagePath = filePath.path;
  }

  void showCustomDialogChooseImage({required BuildContext context}) {
    showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(ConstValue.kSelectImageSource),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text(ConstValue.kPhotoLibrary),
                onTap: () {
                  Navigator.pop(context);
                  pickerImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text(ConstValue.kTakePhoto),
                onTap: () {
                  Navigator.pop(context);
                  pickerImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void openBottomSheet({required BuildContext context}) {
    controllerAddEducation.clear();
    controllerDescEducation.clear();
    imagePath = null;
    inputImagePath.add(null);
    showBottomSheet(
      context: context,
      builder: (context) =>
          Directionality(
            textDirection: TextDirection.rtl,
            child: CustomShowBottomSheet(
              outputImagePath: outputImagePath,
              onPressedDeleteImage: () {
                imagePath = null;
                inputImagePath.add(imagePath);
              },
              onPressedPickImage: () {
                showCustomDialogChooseImage(context: context);
              },
              controllerNameEduction: controllerAddEducation,
              controllerDesEduction: controllerDescEducation,
              onPressedAdd: () async {
                if (formKey.currentState!.validate() == true) {
                  bool inserted = await addNewEducation();
                  if (inserted == true) {
                    listEducationModel.add(
                      EducationModel(
                        id: listEducationModel.length + 1,
                        StagesName: controllerAddEducation.text,
                        desc: controllerDescEducation.text,
                        image: imagePath ?? "",
                      ),
                    );
                    // إرسال نسخة جديدة من القائمة لضمان تحديث الـ UI
                    inputEducationStages.add(listEducationModel);

                    controllerAddEducation.clear();
                    controllerDescEducation.clear();
                    imagePath = null;
                    inputImagePath.add(null);

                    Navigator.pop(context);
                  }
                }
              },
              formKey: formKey,
            ),
          ),
    );
  }

  Future<bool> addNewEducation() async {
    EductionStagesOprations eductionStagesOprations = EductionStagesOprations();
    // ignore: unused_local_variable
    bool inserted = await eductionStagesOprations.insertEductionStages(
      EducationModel(
        id: listEducationModel.length + 1,
        StagesName: controllerAddEducation.text,
        desc: controllerDescEducation.text,
        image: imagePath == null ? "" : imagePath!,
      ),
    );
    return inserted;
  }

  void searchEducationStages(BuildContext context) {
    showSearch(context: context, delegate: CustomSearchDelegate());
  }

  void deleteEducationStages(EducationModel itemEducationModel) async {
    EductionStagesOprations eductionStagesOprations = EductionStagesOprations();
    bool updated = await eductionStagesOprations.softDeleteEductionStages(
      itemEducationModel,
    );
    listEducationModel.removeWhere(
          (education) => education.id == itemEducationModel.id,
    );
  }

  Future<bool> editEducation(EducationModel itemEducationModel) async {
    EductionStagesOprations eductionStagesOprations = EductionStagesOprations();
    // ignore: unused_local_variable
    bool updated = await eductionStagesOprations.editEducationStages(
      itemEducationModel,
    );
    return updated;
  }

  void editEducationStages(EducationModel itemEducationModel,
      BuildContext context,) async {
    controllerAddEducation.text = itemEducationModel.StagesName;
    controllerDescEducation.text = itemEducationModel.desc;
    imagePath = itemEducationModel.image;
    inputImagePath.add(imagePath);
    showBottomSheet(
      context: context,
      builder: (context) =>
          Directionality(
            textDirection: TextDirection.rtl,
            child: CustomShowBottomSheet(
              edit: true,
              outputImagePath: outputImagePath,
              onPressedDeleteImage: () {
                imagePath = null;
                inputImagePath.add(imagePath);
              },
              onPressedPickImage: () {
                showCustomDialogChooseImage(context: context);
              },
              controllerNameEduction: controllerAddEducation,
              controllerDesEduction: controllerDescEducation,
              onPressedAdd: () async {
                if (formKey.currentState!.validate() == true) {
                  EducationModel newEducationModel = EducationModel(
                    id: itemEducationModel.id,
                    StagesName: controllerAddEducation.text,
                    desc: controllerDescEducation.text,
                    image: imagePath == null ? "" : imagePath!,
                  );
                  bool edited = await editEducation(
                      newEducationModel
                  );
                  if (edited == true) {
                    Navigator.pop(context);
                    int indexEducation = listEducationModel.indexOf(itemEducationModel);
                    listEducationModel[indexEducation] = newEducationModel;
                    // listEducationModel.add(
                    //   EducationModel(
                    //     id: listEducationModel.length + 1,
                    //     StagesName: controllerAddEducation.text,
                    //     desc: controllerDescEducation.text,
                    //     image: imagePath ?? "",
                    //   ),
                    // );
                    // إرسال نسخة جديدة من القائمة لضمان تحديث الـ UI
                    inputEducationStages.add(listEducationModel);

                    controllerAddEducation.clear();
                    controllerDescEducation.clear();
                    imagePath = null;
                  }
                }
              },
              formKey: formKey,
            ),
          ),
    );
  }
}
