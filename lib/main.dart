import 'package:drosak/app/my_app.dart';
import 'package:drosak/core/database/sqflite/Eduction_Stages/eduction_stages_oprations.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EductionStagesOprations eductionStagesOprations = EductionStagesOprations();
  bool inserted = await eductionStagesOprations.insertEductionStages(
    EducationModel(
      id: 1,
      StagesName: 'مرحلة ابتدائية',
      desc: 'مرحلة التعليم الابتدائي هي المرحلة الأولى من التعليم الأساسي، وتستمر عادة لمدة ست سنوات. تهدف هذه المرحلة إلى تزويد الطلاب بالمعرفة والمهارات الأساسية في مختلف المواد الدراسية، مثل اللغة العربية، والرياضيات، والعلوم، والدراسات الاجتماعية.',
      image: 'assets/images/education_stages/primary.png',
    ),
  );
  print('Inserted: $inserted');
  runApp(const MyApp());
}
