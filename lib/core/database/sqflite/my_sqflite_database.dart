import 'dart:async';

import 'package:drosak/core/database/sqflite/crud.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqfliteDatabase;

class MySQLiteDatabase extends Crud {
  sqfliteDatabase.Database? _db;
  static final String educationStagesTableName = "educationStagesTableName";
  static final String educationStagesId = "id";
  static final String educationStagesStagesName = "StagesName";
  static final String educationStagesDesc = "desc";
  static final String educationStagesImage = "image";
  static final String educationStagesStatus = "status";
  Future<sqfliteDatabase.Database> _initDatabase() async {
    String databasePath = await sqfliteDatabase.getDatabasesPath();
    String drosakDatabaseName = "drosak.db";
    String realDatabasePath = join(databasePath, drosakDatabaseName);
    int versionDatabase = 1;
    _db ??= await sqfliteDatabase.openDatabase(
      realDatabasePath,
      onCreate: _onCrate,
      onUpgrade: _onUpgrade,
      version: versionDatabase,
    );
    return _db!;
  }

  FutureOr<void> _onUpgrade(sqfliteDatabase.Database db, int oldVersion, int newVersion) async {
    await (db.execute('DROP TABLE IF EXISTS $educationStagesTableName'));
    await db.execute(
      "CREATE TABLE IF NOT EXISTS $educationStagesTableName"
      " ( $educationStagesId INTEGER PRIMARY KEY AUTOINCREMENT ,"
      "  $educationStagesStagesName TEXT , "
      "  $educationStagesDesc TEXT , "
      "  $educationStagesStatus INTEGER DEFAULT 1 , "
      "  $educationStagesImage  TEXT )",
    );
  }

  Future<void> _onCrate(sqfliteDatabase.Database db, int version) async {
    await db.execute(
      "CREATE TABLE IF NOT EXISTS $educationStagesTableName"
      " ( $educationStagesId INTEGER PRIMARY KEY AUTOINCREMENT ,"
      "  $educationStagesStagesName TEXT , "
      "  $educationStagesDesc TEXT , "
      "  $educationStagesStatus INTEGER DEFAULT 1 , "
      "  $educationStagesImage  TEXT )",
    );
  }

  @override
  Future<bool> delete({
    required String tableName,
    required String where,
  }) async {
    // TODO: implement delete
    await _initDatabase();
    int deleteUsers = await _db!.delete(tableName, where: where);
    await _db!.close();
    return deleteUsers > 0;
  }

  @override
  Future<bool> insert({
    required String tableName,
    required Map<String, Object?> values,
  }) async {
    // TODO: implement insert
    await _initDatabase();
    var tableName2 = tableName;
    int insertUsers = await _db!.insert(tableName2, values);
    await _db!.close();
    return insertUsers > 0;
  }

  @override
  Future<List<Map<String, Object?>>> select({required String tableName}) async {
    await _initDatabase();
    List<Map<String, Object?>> selectUsers = await _db!.query(tableName);
    // List<Map<String, Object?>> selectProducts = await _db!.query("products");
    await _db!.close();
    return selectUsers;
  }

  @override
  Future<List<Map<String, Object?>>> search({
    required String tableName,
    required String searchWord,
  }) async {
    await _initDatabase();
    List<Map<String, Object?>> data = await _db!.query(
      tableName,
      where: '$educationStagesStagesName LIKE ?',
      whereArgs: ['%$searchWord%'],
    );

    // List<Map<String, Object?>> selectProducts = await _db!.query("products");
    await _db!.close();
    return data;
  }

  @override
  Future<bool> update({
    required String tableName,
    required Map<String, Object?> values,
    required String where,
  }) async {
    await _initDatabase();
    int updateUsers = await _db!.update(tableName, values, where: where);
    await _db!.close();
    return updateUsers > 0;
  }
}
