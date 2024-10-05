import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBHelper {
  /// Singleton instance
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  /// table name -> academicYear
  static const String TABLE_ACADEMIC_YEARS = 'academicYear';
  static const String COLUMN_ACADEMIC_YEAR_ID = 'id';
  static const String COLUMN_ACADEMIC_YEAR_NAME = 'name';
  static const String COLUMN_ACADEMIC_YEAR_START_DATE = 'startDate';
  static const String COLUMN_ACADEMIC_YEAR_END_DATE = 'endDate';
  static const String COLUMN_ACADEMIC_YEAR_STATUS = 'status';

  Database? myDB;

  /// db Open (path -> if exists then open else create)
  Future<Database> getDB() async {
    // if (myDB != null) {
    //   return myDB!;
    // } else {
    //   myDB = await openDB();
    //   return myDB!;
    // }
    /// same code as above
    myDB ??= await openDB();
    return myDB!;
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    String dbPath = join(appDir.path, 'qmma.db');

    if (Platform.isWindows) {
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      return await databaseFactory.openDatabase(dbPath);
    } else {
      return await openDatabase(dbPath, onCreate: (db, version) async {
        await db.execute(
          'create table $TABLE_ACADEMIC_YEARS ('
          '$COLUMN_ACADEMIC_YEAR_ID integer primary key autoincrement, $COLUMN_ACADEMIC_YEAR_NAME text, $COLUMN_ACADEMIC_YEAR_START_DATE text, $COLUMN_ACADEMIC_YEAR_END_DATE text, $COLUMN_ACADEMIC_YEAR_STATUS boolean'
          ')',
        );

        /// more queries
        /// more queries
        /// more queries
      }, version: 1);
    }
  }

  Future<bool> addAcademicYear(
      {required String name,
      required String startDate,
      required String endDate,
      required bool status}) async {
    var db = await getDB();
    int rowsEffected = await db.insert(TABLE_ACADEMIC_YEARS, {
      COLUMN_ACADEMIC_YEAR_NAME: name,
      COLUMN_ACADEMIC_YEAR_START_DATE: startDate,
      COLUMN_ACADEMIC_YEAR_END_DATE: endDate,
      COLUMN_ACADEMIC_YEAR_STATUS: status
    });

    return rowsEffected > 0;
  }

  Future<List<Map<String, Object?>>> getAcademicYears() async {
    var db = await getDB();
    return await db.query(TABLE_ACADEMIC_YEARS);
  }

  /// all queries
}
