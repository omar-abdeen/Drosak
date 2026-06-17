import 'package:drosak/core/database/sqflite/my_sqflite_database.dart';
import 'package:drosak/model/Education/education_model.dart';

class EductionStagesOprations extends MySQLiteDatabase {
  Future<bool> insertEductionStages(EducationModel educationModel) async {
    return insert(
      tableName: MySQLiteDatabase.educationStagesTableName,
      values: {
        MySQLiteDatabase.educationStagesStagesName: educationModel.StagesName,
        MySQLiteDatabase.educationStagesDesc: educationModel.desc,
        MySQLiteDatabase.educationStagesImage: educationModel.image,
      },
    );
  }
  Future<List<Map<String, dynamic>>> getAllEductionStages() async {
    return select(
      tableName: MySQLiteDatabase.educationStagesTableName,
    );
  }
}
