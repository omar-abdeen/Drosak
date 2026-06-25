import 'package:drosak/core/database/sqflite/my_sqflite_database.dart';

class EducationModel {
  final int id;
  final String StagesName;
  final String desc;
  final String image;
  final int? status;
  @override
  String toString() {
    return 'EducationModel(id: $id, StagesName: $StagesName, desc: $desc, image: $image, status: $status)';
  }
  Map<String, dynamic> toJson() {
    return {
       MySQLiteDatabase.educationStagesStagesName: StagesName,
        MySQLiteDatabase.educationStagesDesc: desc,
        MySQLiteDatabase.educationStagesImage: image,
    };
  }
  EducationModel({
    required this.id,
    required this.StagesName,
    required this.desc,
    required this.image,
     this.status = 1,
  });
  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      id: json['id'] as int,
      StagesName: json['StagesName'] as String,
      desc: json['desc'] as String,
      image: json['image'] as String,
      status: json['status'] as int?,
    );
  }
}
