import 'package:drosak/core/database/sqflite/my_sqflite_database.dart';
import 'package:drosak/model/Education/education_model.dart';

class EductionStagesOprations extends MySQLiteDatabase {
  Future<bool> insertEductionStages(EducationModel educationModel) async {
    return insert(
      tableName: MySQLiteDatabase.educationStagesTableName,
      values: educationModel.toJson(),
    );
  }

  Future<List<EducationModel>> getAllEductionStages() async {
    List<EducationModel> listEducationModel = [];
    List<Map<String, Object?>> data = await select(
      tableName: MySQLiteDatabase.educationStagesTableName,
      where: '${MySQLiteDatabase.educationStagesStatus} = ?',
      whereArgs: [1],
    );
    listEducationModel += data
        .map((item) => EducationModel.fromJson(item))
        .toList();
    return listEducationModel;
  }

  Future<List<EducationModel>> searchEductionStages({
    required String searchWord,
  }) async {
    List<EducationModel> listEducationModel = [];
    List<Map<String, Object?>> data = await search(
      tableName: MySQLiteDatabase.educationStagesTableName,
      searchWord: searchWord,
    );
    listEducationModel += data
        .map((item) => EducationModel.fromJson(item))
        .toList();
    return listEducationModel;
  }

  Future<bool> softDeleteEductionStages(EducationModel educationModel) async {
    return update(
      tableName: MySQLiteDatabase.educationStagesTableName,
      values: {MySQLiteDatabase.educationStagesStatus: 0},
      where: '${MySQLiteDatabase.educationStagesId} = ${educationModel.id}',
    );
  }

}
